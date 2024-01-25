# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Applicant < Person
      attribute :date_of_birth, Types::JSON::Date
      attribute? :benefit_type, Types::BenefitType.optional
      attribute? :nino, Types::String.optional
      attribute? :home_address, Address.optional
      attribute? :correspondence_address, Address.optional
      attribute? :correspondence_address_type, Types::CorrespondenceAddressType.optional
      attribute? :telephone_number, Types::String.optional
    end
  end
end
