# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class MeansDetails < Base
      attribute :employment_status, Types::EmploymentStatusType

      attribute :income_details do # rubocop:disable Metrics/BlockLength
        attribute :benefits, Types::Array.of(Base) do
          attribute :type, Types::OtherBenefitType
          attributes_from Amount
        end

        attribute? :employment_details do
          attribute :paye, Types::Array.of(Base) do
            attribute :amount, Types::Integer
            attribute :date, Types::JSON::Date
            attribute :deductions, Types::Array.of(Base) do
              attribute :type, Types::String
              attribute :amount, Types::Integer
            end
          end
          attribute? :other do
            attribute :amount, Types::Integer
            attribute :details, Types::String
          end
        end

        attribute? :self_employment_details do
          attribute :businesses, Types::Array.of(Base) do
            attribute :name, Types::String
            attribute :address, Address
            attribute :last_two_years_tax_liability, Types::Integer
            attribute :total_turnover, Types::Integer
            attribute :total_drawing, Types::Integer
            attribute :total_profit, Types::Integer
            attribute :director_salary, Types::Integer
            attribute :share, Types::Float
          end
        end

        attribute? :other_income, Types::Array.of(Base) do
          attribute :type, Types::OtherIncomeType
          attributes_from Amount
        end

        attribute :total, Types::Integer
      end

      attribute? :capital_details do
        attribute :houses, Types::Array.of(Base) do
          attribute :ownership_type, Types::OwnershipType
          attribute :share, Types::Float
          attributes_from Asset
        end

        attribute :vehicles, Types::Array.of(Base) do
          attribute :regular_use, Types::Bool
          attribute :purchased_over_three_years_ago, Types::Bool
          attributes_from Asset
        end

        attribute :savings, Types::Array.of(Base) do
          attribute :type, Types::SavingsType
          attributes_from Asset
        end

        attribute :assets, Types::Array.of(Base) do
          attribute :type, Types::AssetType
          attributes_from Asset
        end

        attribute :total, Types::Float
      end

      attribute? :outgoings_details do
        attribute :outgoings, Types::Array.of(Base) do
          attribute :type, Types::OutgoingsType
          attributes_from Amount
        end
      end

      attribute? :dependents, Types::Array.of(Base) do
        attribute :date_of_birth, Types::JSON::Date
      end
    end
  end
end
