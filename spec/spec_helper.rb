require 'rspec'

require 'vcr'

require_relative '../lib/gollum_client'

GollumClient.path_prefix = '/codecabulary/'
GollumClient.base_url = 'http://localhost:9292'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock # or :fakeweb
  c.configure_rspec_metadata!
  c.default_cassette_options = { :record => :new_episodes }
end

RSpec.configure do |c|
  # so we can use :vcr rather than :vcr => true;
  # in RSpec 3 this will no longer be necessary.
  c.treat_symbols_as_metadata_keys_with_true_values = true
end
