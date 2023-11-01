# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class IncomeDetails < Base
      attribute :benefits, Types::Array.of(Base) do
        attribute :type, Types::OtherBenefitType
        attributes_from Amount
      end

      attribute? :employment_details do
        attribute :paye, Types::Array.of(Base) do
          attribute :amount, Types::PenceSterling
          attribute :date, Types::JSON::Date
          attribute :deductions, Types::Array.of(Base) do
            attribute :type, Types::String
            attribute :amount, Types::PenceSterling
          end
        end

        attribute? :other do
          attribute :amount, Types::PenceSterling
          attribute :details, Types::String
        end

        attribute? :businesses, Types::Array.of(Base) do
          attribute :name, Types::String
          attribute :address, Address
          attribute :last_two_years_tax_liability, Types::PenceSterling
          attribute :total_turnover, Types::PenceSterling
          attribute :total_drawing, Types::PenceSterling
          attribute :total_profit, Types::PenceSterling
          attribute :director_salary, Types::PenceSterling
          attribute :share, Types::Float
        end
      end

      attribute? :other_income, Types::Array.of(Base) do
        attribute :type, Types::OtherIncomeType
        attributes_from Amount
      end

      attribute :total, Types::PenceSterling
    end
  end
end