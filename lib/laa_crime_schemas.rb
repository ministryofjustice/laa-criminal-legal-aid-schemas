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
require_relative 'laa_crime_schemas/structs/date_stamp_context'
require_relative 'laa_crime_schemas/structs/amount'
require_relative 'laa_crime_schemas/structs/asset'
require_relative 'laa_crime_schemas/structs/offence'
require_relative 'laa_crime_schemas/structs/address'
require_relative 'laa_crime_schemas/structs/person'
require_relative 'laa_crime_schemas/structs/applicant'
require_relative 'laa_crime_schemas/structs/partner'
require_relative 'laa_crime_schemas/structs/codefendant'
require_relative 'laa_crime_schemas/structs/other_charge'
require_relative 'laa_crime_schemas/structs/case_details'
require_relative 'laa_crime_schemas/structs/provider_details'
require_relative 'laa_crime_schemas/structs/return_details'
require_relative 'laa_crime_schemas/structs/document'
require_relative 'laa_crime_schemas/structs/deduction'
require_relative 'laa_crime_schemas/structs/test_result'
require_relative 'laa_crime_schemas/structs/decision'
require_relative 'laa_crime_schemas/structs/employment'
require_relative 'laa_crime_schemas/structs/business'
require_relative 'laa_crime_schemas/structs/income_details'
require_relative 'laa_crime_schemas/structs/outgoing'
require_relative 'laa_crime_schemas/structs/outgoings_details'
require_relative 'laa_crime_schemas/structs/saving'
require_relative 'laa_crime_schemas/structs/property_owner'
require_relative 'laa_crime_schemas/structs/property'
require_relative 'laa_crime_schemas/structs/investment'
require_relative 'laa_crime_schemas/structs/national_savings_certificate'
require_relative 'laa_crime_schemas/structs/capital_details'
require_relative 'laa_crime_schemas/structs/means_details'
require_relative 'laa_crime_schemas/structs/prompt'
require_relative 'laa_crime_schemas/structs/evidence_details'
require_relative 'laa_crime_schemas/structs/crime_application'
require_relative 'laa_crime_schemas/structs/anonymised_crime_application'
require_relative 'laa_crime_schemas/structs/pruned_application'

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
    # @yield [JSON] Invokes the block with the fixture parsed JSON
    # @return [Pathname] path to the fixture
    #
    def fixture(version, type: 'application', name: 'application', &block)
      file = Pathname.new(
        File.join(root, 'spec', 'fixtures', type, version.to_s, "#{name}.json")
      )

      block ? yield(JSON.parse(file.read)) : file
    end
  end
end
