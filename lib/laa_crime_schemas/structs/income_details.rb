# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class IncomeDetails < Base
      attribute? :income_above_threshold, Types::YesNoValue

      attribute? :benefits, Types::Array.of(Base) do
        attribute :type, Types::OtherBenefitType
        attributes_from Amount
      end

      attribute? :employment_type, Types::Array.of(Types::EmploymentType)
      attribute? :ended_employment_within_three_months, Types::YesNoValue.optional
      attribute? :lost_job_in_custody, Types::YesNoValue.optional
      attribute? :date_job_lost, Types::JSON::Date.optional
      attribute? :has_frozen_income_or_assets, Types::YesNoValue.optional
      attribute? :has_savings, Types::YesNoValue.optional
      attribute? :manage_without_income, Types::ManageWithoutIncomeTypes.optional
      attribute? :manage_other_details, Types::String.optional
      attribute? :client_owns_property, Types::YesNoValue.optional

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

      attribute? :dependants, Types::Array.of(Base) do
        attribute :age, Types::DependantAge
      end

      attribute? :other_income, Types::Array.of(Base) do
        attribute :type, Types::OtherIncomeType
        attributes_from Amount
      end

      attribute? :total, Types::PenceSterling
    end
  end
end
