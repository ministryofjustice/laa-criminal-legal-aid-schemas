# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class OutgoingsDetails < Base
      attribute? :outgoings, Types::Array.of(Base) do
        attribute :payment_type, Types::OutgoingsType
        attributes_from Amount
      end

      attribute? :housing_payment_type, Types::HousingPaymentType.optional
      attribute? :income_tax_rate_above_threshold, Types::YesNoValue.optional
      attribute? :outgoings_more_than_income, Types::YesNoValue.optional
      attribute? :how_manage, Types::String.optional
      attribute? :pays_council_tax, Types::YesNoValue.optional
      attribute? :has_no_other_outgoings, Types::YesNoValue.optional
    end
  end
end
