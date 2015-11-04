# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gollum_client/version'

Gem::Specification.new do |spec|
  spec.name          = "gollum_client"
  spec.version       = GollumClient::VERSION
  spec.authors       = ["Dan Pickett"]
  spec.email         = ["dan.pickett@launchware.com"]
  spec.description   = %q{readonly web client for Gollum}
  spec.summary       = %q{readonly web client for Gollum that uses faraday}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday"
  spec.add_dependency "faraday_middleware"
  spec.add_dependency "configatron"
  spec.add_dependency "nokogiri"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock", "~> 1.11.0"
  spec.add_development_dependency "vcr"
end
