# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'postcodeapi/version'

Gem::Specification.new do |spec|
  spec.name          = "ww-postcodeapi"
  spec.version       = Postcodeapi::VERSION
  spec.authors       = ["Webworkz"]
  spec.email         = ["info@webworkz.nl"]
  spec.description   = %q{API wrapper for postcodeapi.nu zipcode api}
  spec.summary       = %q{Get address details from the postcodeapi.nu api}
  spec.homepage      = "https://github.com/webworkz/postcodeapi"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.13.0"
  spec.add_development_dependency "capybara", "~> 2.1.0"
  spec.add_development_dependency "vcr", "~> 2.4.0"
  spec.add_development_dependency "webmock", "~> 1.8.0"
  spec.add_runtime_dependency "rest-client"
end
