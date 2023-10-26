# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class MeansDetails < Base
      attribute :income_details do
        attribute :benefits, Types::Array.of(Base) do
          attribute :type, Types::OtherBenefitType
          attribute :amount, Types::Float
          attribute :frequency, Types::PaymentFrequency
          attribute :details, Types::String.optional
        end

        attribute :other_income, Types::Array.of(Base) do
          attribute :type, Types::OtherIncomeType
          attribute :amount, Types::Float
          attribute :frequency, Types::PaymentFrequency
          attribute :details, Types::String.optional
        end
      end

      attribute :total_income, Types::Float
    end
  end
end
