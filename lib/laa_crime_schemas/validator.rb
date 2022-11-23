# frozen_string_literal: true

module LaaCrimeSchemas
  class Validator
    VERSION_PROPERTY = 'schema_version'

    attr_reader :document, :version

    def initialize(document, version: nil)
      @document = document
      @version = version
    end

    def schema_version
      @schema_version ||= version || version_from_document
    end

    def valid?
      JSON::Validator.validate(
        schema, document, validate_schema: true
      )
    rescue JSON::Schema::ReadFailed => e
      raise Errors::SchemaNotFoundError, e.message
    end

    def fully_validate
      JSON::Validator.fully_validate(
        schema, document, validate_schema: true, errors_as_objects: true
      )
    rescue JSON::Schema::ReadFailed => e
      raise Errors::SchemaNotFoundError, e.message
    end

    private

    def schema
      [LaaCrimeSchemas.root, 'schemas', schema_version.to_f, 'application.json'].join('/')
    end

    def version_from_document
      doc = document.respond_to?(:fetch) ? document : JSON.parse(document)
      doc.fetch(VERSION_PROPERTY)
    rescue StandardError
      raise Errors::SchemaVersionError, '`schema_version` attribute not found in document'
    end
  end
end
