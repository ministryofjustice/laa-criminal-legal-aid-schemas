# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Business < Base
      attribute :ownership_type, Types::OwnershipType
      attribute :business_type, Types::BusinessInvolvementType
      attribute? :trading_name, Types::String.optional
      attribute? :address, Address.optional
      attribute? :description, Types::String.optional
      attribute? :trading_start_date, Types::JSON::Date.optional
      attribute? :has_additional_owners, Types::YesNoValue.optional
      attribute? :additional_owners, Types::String.optional
      attribute? :has_employees, Types::YesNoValue.optional
      attribute? :number_of_employees, Types::Integer.optional
      attribute? :salary, Amount.optional
      attribute? :total_income_share_sales, Amount.optional
      attribute? :percentage_profit_share, Types::Float.optional

      attribute? :turnover, Amount.optional
      attribute? :drawings, Amount.optional
      attribute? :profit, Amount.optional
    end
  end
end
