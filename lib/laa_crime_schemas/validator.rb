# frozen_string_literal: true

module LaaCrimeSchemas
  class Validator
    VERSION_PROPERTY = 'schema_version'

    attr_reader :document, :version

    def initialize(document, version: nil, schema_name: 'application', list: false)
      @document = document
      @version = version
      @schema_name = schema_name
      @list = list
    end

    def schema_version
      @schema_version ||= (version || version_from_document).to_f
    end

    def valid?
      JSON::Validator.validate(
        schema, document, validate_schema: true, list:
      )
    rescue JSON::Schema::ReadFailed => e
      raise Errors::SchemaNotFoundError, e.message
    end

    def fully_validate
      JSON::Validator.fully_validate(
        schema, document, validate_schema: true, errors_as_objects: true, list:
      )
    rescue JSON::Schema::ReadFailed => e
      raise Errors::SchemaNotFoundError, e.message
    end

    private

    attr_reader :schema_name, :list

    def schema
      File.join(LaaCrimeSchemas.root, 'schemas', schema_version.to_s, "#{schema_name}.json")
    end

    def version_from_document
      doc = document.respond_to?(:fetch) ? document : JSON.parse(document)
      doc.fetch(VERSION_PROPERTY)
    rescue StandardError
      raise Errors::SchemaVersionError, '`schema_version` attribute not found in document'
    end
  end
end
