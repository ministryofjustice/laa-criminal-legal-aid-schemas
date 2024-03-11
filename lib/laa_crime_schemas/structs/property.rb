# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Property < Base
      attribute :property_type, Types::PropertyType
      attribute :house_type, Types::HouseType
      attribute :custom_house_type, Types::String
      attribute :size_in_acres, Types::Integer.optional
      attribute :usage, Types::String.optional
      attribute :bedrooms, Types::Integer
      attribute :value, Types::PenceSterling
      attribute :outstanding_mortgage, Types::PenceSterling
      attribute :percentage_applicant_owned, Types::Integer
      attribute :percentage_partner_owned, Types::Integer.optional
      attribute :is_home_address, Types::YesNoValue
      attribute :has_other_owners, Types::YesNoValue
      # attribute :address, Types::JSON.optional # TODO
    end
  end
end
