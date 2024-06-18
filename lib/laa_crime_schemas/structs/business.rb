# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Business < Base
      attribute :ownership_type, Types::OwnershipType
      attribute :business_type, Types::BusinessType
      attribute? :trading_name, Types::String
      attribute? :address, Address
      attribute? :description, Types::String
      attribute? :trading_start_date, Types::JSON::Date
      attribute? :has_additional_owners, Types::YesNoValue
      attribute? :additional_owners, Types::String.optional
      attribute? :has_employees, Types::YesNoValue
      attribute? :number_of_employees, Types::Integer.optional
      attribute? :salary, Types::PenceSterling.optional
      attribute? :total_income_share_sales, Types::PenceSterling.optional
      attribute? :percentage_profit_share, Types::Float.optional

      attribute? :turnover, Amount
      attribute? :drawings, Amount
      attribute? :profit, Amount
    end
  end
end
