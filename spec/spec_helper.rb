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

require 'dry-schema'

RSpec.shared_examples "a struct aligned to its json schema" do |parameter|
  Dry::Schema.load_extensions(:json_schema)
  Dry::Schema.load_extensions(:struct)

  let(:struct_json_schema) do
    described_class.json_schema(loose: false)
  end

  let(:json_schema) do
    json = File.read(
      File.join(
        LaaCrimeSchemas.root, 'schemas', version.to_s, "#{schema_name}.json"
      )
    )

    JSON.parse(json, symbolize_names: true)
  end

  let(:json_schema_base) {
    {
      "$schema": "http://json-schema.org/draft-06/schema#",
      "$id": "ministryofjustice/laa-criminal-legal-aid-schemas/main/schemas/#{version}/#{schema_name}.json",
      title: schema_title,
      description: "Currencies amounts are stored in pence sterling"
    }
  }

  let(:struct_json_schema) do
    # Use Dry::Schema's built in json_schema compiler to produce json_schema
    # from the struct to compare with this gems json_schema.
    struct_schema = Dry::Schema.JSON do
      optional(:struct).maybe(LaaCrimeSchemas::Structs::MeansDetails)
    end

    json_schema_base.merge(
      struct_schema.json_schema(loose: true).fetch(:properties).fetch(:struct)
    )
  end

  # Skipping because Dry::Schema::JSONSchema::SchemaCompiler is not generating nested Hash objects correctly
  # Causing valid structs to generate invalid JSON schema
  # See: https://github.com/dry-rb/dry-schema/pull/462 and https://github.com/dry-rb/dry-schema/issues/400
  it 'is alligned with its json_schema', skip: true do
    expect(struct_json_schema).to match(json_schema), -> { JSON.pretty_generate(struct_json_schema, indent: '  ', space: ' ') }
  end
end
