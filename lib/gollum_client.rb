require 'configatron'
require 'gollum_client/version'

require 'gollum_client/page'
require 'gollum_client/app'

module GollumClient
  class << self
    def base_url=(url)
      configatron.gollum_client.base_url = url
    end

    def base_url
      configatron.gollum_client.base_url
    end

    def path_prefix=(prefix)
      configatron.gollum_client.path_prefix = prefix
    end

    def path_prefix
      configatron.gollum_client.path_prefix
    end
  end
end
