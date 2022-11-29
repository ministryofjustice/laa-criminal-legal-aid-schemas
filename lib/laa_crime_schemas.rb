# frozen_string_literal: true

require 'dry-struct'

require 'json'
require 'json-schema'

require_relative 'laa_crime_schemas/version'
require_relative 'laa_crime_schemas/errors'
require_relative 'laa_crime_schemas/validator'

require_relative 'laa_crime_schemas/traits/full_name'

require_relative 'laa_crime_schemas/types/types'

require_relative 'laa_crime_schemas/structs/base'
require_relative 'laa_crime_schemas/structs/offence'
require_relative 'laa_crime_schemas/structs/address'
require_relative 'laa_crime_schemas/structs/person'
require_relative 'laa_crime_schemas/structs/applicant'
require_relative 'laa_crime_schemas/structs/codefendant'
require_relative 'laa_crime_schemas/structs/crime_application'

module LaaCrimeSchemas
  class << self
    def root
      File.expand_path('..', __dir__)
    end

    # Get the path to an application fixture (JSON document)
    # for a specific schema version.
    #
    # @param version [Float] The schema version
    # @param type [String] Type of fixture. Optional. Defaults to `application`
    # @param name [String] Name of the fixture. Optional. Defaults to `application`
    # @return [Pathname] path to the fixture
    #
    def fixture(version, type: 'application', name: 'application')
      Pathname.new(
        File.join(root, 'spec', 'fixtures', type, version.to_s, "#{name}.json")
      )
    end
  end
end
