# frozen_string_literal: true

require 'json'
require 'json-schema'

require_relative 'laa_crime_schemas/version'
require_relative 'laa_crime_schemas/validator'

module LaaCrimeSchemas
  class ValidationError < StandardError; end

  def self.root
    File.expand_path('..', __dir__)
  end
end
