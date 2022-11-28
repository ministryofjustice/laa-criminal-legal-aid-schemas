# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Address < Base
      attribute? :lookup_id, Types::String.optional
      attribute :address_line_one, Types::String
      attribute :address_line_two, Types::String.optional
      attribute :city, Types::String
      attribute :country, Types::String
      attribute :postcode, Types::String
    end
  end
end
