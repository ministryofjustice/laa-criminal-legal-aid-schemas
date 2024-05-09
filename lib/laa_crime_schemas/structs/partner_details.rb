# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class PartnerDetails < Person
      attribute? :date_of_birth, Types::JSON::Date.optional
      # TODO: will benefit_type live in partner details? or a new passporting benefit/benefit check table?
      attribute? :benefit_type, Types::BenefitType.optional
      attribute? :last_jsa_appointment_date, Types::JSON::Date.optional
      attribute? :nino, Types::String.optional
      # TODO: is the attribute correspondence_address_type required for partner?
      attribute? :home_address, Address.optional

      attribute? :involvement_in_case, Types::String.optional
      attribute? :conflict_of_interest, Types::YesNoValue.optional
      attribute? :has_same_address_as_client, Types::YesNoValue.optional
    end
  end
end
