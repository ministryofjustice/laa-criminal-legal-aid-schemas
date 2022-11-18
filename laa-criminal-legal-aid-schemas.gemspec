# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'laa_crime_schemas/version'

Gem::Specification.new do |spec|
  spec.name     = 'laa-criminal-legal-aid-schemas'
  spec.version  = LaaCrimeSchemas::VERSION

  spec.authors  = ['LAA Crime Apps Team']
  spec.email    = ['laa-crime-apps@digital.justice.gov.uk']

  spec.summary  = 'LAA Criminal Legal Aid schemas and validators'
  spec.homepage = 'https://github.com/ministryofjustice/laa-criminal-legal-aid-schemas'
  spec.license  = 'MIT'

  spec.metadata = {
    'rubygems_mfa_required' => 'true'
  }

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 3.0.0'

  spec.add_runtime_dependency 'json-schema', '~> 3.0.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
end
