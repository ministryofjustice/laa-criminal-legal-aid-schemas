# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Property < Base
      attribute :property_type, Types::PropertyType
      attribute :house_type, Types::HouseType.optional
      attribute :other_house_type, Types::String.optional
      attribute :size_in_acres, Types::Integer.optional
      attribute :usage, Types::String.optional
      attribute :bedrooms, Types::Integer.optional
      attribute :value, Types::PenceSterling.optional
      attribute :outstanding_mortgage, Types::PenceSterling.optional
      attribute :percentage_applicant_owned, Types::Float.optional
      attribute :percentage_partner_owned, Types::Float.optional
      attribute :is_home_address, Types::YesNoValue.optional
      attribute :has_other_owners, Types::YesNoValue.optional
      attribute :address, Address.optional
      attribute? :property_owners, Types::Array.of(PropertyOwner).default([].freeze)
    end
  end
end
