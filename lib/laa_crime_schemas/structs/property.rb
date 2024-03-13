# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Property < Base
      attribute :property_type, Types::PropertyType
      attribute :house_type, Types::HouseType.optional
      attribute :custom_house_type, Types::String.optional
      attribute :size_in_acres, Types::Integer.optional
      attribute :usage, Types::String.optional
      attribute :bedrooms, Types::Integer.optional
      attribute :value, Types::PenceSterling
      attribute :outstanding_mortgage, Types::PenceSterling
      attribute :percentage_applicant_owned, Types::Float
      attribute :percentage_partner_owned, Types::Float.optional
      attribute :is_home_address, Types::YesNoValue.optional
      attribute :has_other_owners, Types::YesNoValue
      attribute :address, Address.optional
    end
  end
end
