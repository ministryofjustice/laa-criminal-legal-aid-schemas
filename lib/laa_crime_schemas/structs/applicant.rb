# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Applicant < Person
      attribute :date_of_birth, Types::JSON::Date
      attribute :nino, Types::String
      attribute? :home_address, Address.optional
      attribute? :correspondence_address, Address.optional
      attribute? :telephone_number, Types::String.optional
      attribute :correspondence_address_type, Types::CorrespondenceAddressType
    end
  end
end
