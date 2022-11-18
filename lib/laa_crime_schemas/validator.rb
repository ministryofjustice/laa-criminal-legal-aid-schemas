# frozen_string_literal: true

module LaaCrimeSchemas
  class Validator
    VERSION_PROPERTY = 'schema_version'
    MIN_VERSION = 0.1

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
    end

    def fully_validate
      JSON::Validator.fully_validate(
        schema, document, validate_schema: true, errors_as_objects: true
      )
    end

    private

    def schema
      [LaaCrimeSchemas.root, 'schemas', schema_version.to_f, 'application.json'].join('/')
    end

    def version_from_document
      doc = document.respond_to?(:fetch) ? document : JSON.parse(document)
      doc.fetch(VERSION_PROPERTY)
    rescue StandardError
      MIN_VERSION
    end
  end
end
