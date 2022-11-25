# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Person < Base
      attribute :first_name, Types::String
      attribute :last_name, Types::String
      attribute? :other_names, Types::String.optional
      attribute :date_of_birth, Types::JSON::Date
      attribute :nino, Types::String

      attribute? :address, Address.optional
      attribute? :correspondence_address, Address.optional
      attribute? :telephone_number, Types::String.optional
      attribute :correspondence_address_type, Types::CorrespondenceAddressType
    end
  end
end
