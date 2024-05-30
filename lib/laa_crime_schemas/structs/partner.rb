# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Partner < Person
      # TODO: Although Partner is an optional Struct, and not required in
      # json-schema, dry-types keeps requiring first_name/last_name as defined in
      # the Partner Struct type
      attribute? :first_name, Types::String
      attribute? :last_name, Types::String

      attribute? :date_of_birth, Types::JSON::Date.optional
      attribute? :benefit_type, Types::BenefitType.optional
      attribute? :last_jsa_appointment_date, Types::JSON::Date.optional
      attribute? :nino, Types::String.optional
      attribute? :home_address, Address.optional

      attribute? :involvement_in_case, Types::CaseInvolvement.optional
      attribute? :conflict_of_interest, Types::YesNoValue.optional
      attribute? :has_same_address_as_client, Types::YesNoValue.optional
    end
  end
end
