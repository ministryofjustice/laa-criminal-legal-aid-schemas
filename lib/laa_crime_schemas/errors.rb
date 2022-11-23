# frozen_string_literal: true

module LaaCrimeSchemas
  module Errors
    class ValidationError < StandardError; end
    class SchemaVersionError < StandardError; end
    class SchemaNotFoundError < StandardError; end
  end
end
