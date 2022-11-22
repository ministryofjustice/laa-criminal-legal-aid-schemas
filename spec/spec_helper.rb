# frozen_string_literal: true

require 'bundler/setup'
require 'simplecov'

SimpleCov.minimum_coverage 100
SimpleCov.start

require_relative '../lib/laa_crime_schemas'

Dir[File.join('./spec', 'support', '**', '*.rb')].sort.each(&method(:require))

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def file_fixture(fixture_name)
  Pathname.new(File.join('spec/fixtures', fixture_name))
end
