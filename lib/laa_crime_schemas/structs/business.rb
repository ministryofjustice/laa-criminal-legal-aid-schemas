# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Business < Base
      attribute :ownership_type, Types::OwnershipType
      attribute :type, Types::BusinessType
      attribute :trading_name, Types::String
      attribute :address, Address
      attribute :description, Types::String
      attribute :trading_date, Types::JSON::Date
      attribute :has_additional_owners, Types::YesNoValue
      attribute? :owners, Types::String.optional
      attribute :has_employees, Types::YesNoValue
      attribute? :number_of_employees, Types::Integer.optional
      attribute? :salary, Types::PenceSterling.optional
      attribute? :total_income, Types::PenceSterling.optional
      attribute? :profit_share, Types::Float.optional

      attribute? :financials, Types::Coercible::Array.of(Base).default([].freeze) do
        attribute :financial_type, Types::FinancialType
        attributes_from Amount
      end
    end
  end
end
