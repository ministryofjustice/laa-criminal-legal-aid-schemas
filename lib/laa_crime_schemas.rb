# frozen_string_literal: true

require 'dry-struct'

require 'json'
require 'json-schema'

require_relative 'laa_crime_schemas/version'
require_relative 'laa_crime_schemas/validator'

require_relative 'laa_crime_schemas/types/types'

require_relative 'laa_crime_schemas/structs/base'
require_relative 'laa_crime_schemas/structs/address'
require_relative 'laa_crime_schemas/structs/person'
require_relative 'laa_crime_schemas/structs/codefendant'
require_relative 'laa_crime_schemas/structs/crime_application'

module LaaCrimeSchemas
  class ValidationError < StandardError; end

  def self.root
    File.expand_path('..', __dir__)
  end
end
