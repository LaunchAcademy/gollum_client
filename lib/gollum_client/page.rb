require 'faraday'
require 'faraday_middleware'
require 'nokogiri'

module GollumClient
  class Page
    attr_reader :body, :title

    def initialize(title, body)
      @title = title
      @body = body
    end

    class << self
      def fetch(path = '')
        resp = nil
        begin
          resp = connection.get(GollumClient.path_prefix + path)
        rescue FaradayMiddleware::RedirectLimitReached
          return nil
        end

        parsed_resp = Nokogiri.parse(resp.body)
        node = parsed_resp.css('#wiki-content').first
        if node
          title = parsed_resp.css('#head h1').first.inner_html
          new(title, node.to_s)
        else
          nil
        end
      end

      def connection
        Faraday.new(:url => GollumClient.base_url) do |faraday|
          faraday.use FaradayMiddleware::FollowRedirects
          faraday.request  :url_encoded             # form-encode POST params
          # faraday.response :logger                  # log requests to STDOUT
          faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
        end
      end
    end
  end
end
