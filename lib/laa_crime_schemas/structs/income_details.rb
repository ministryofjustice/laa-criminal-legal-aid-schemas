# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class IncomeDetails < Base
      attribute? :income_above_threshold, Types::YesNoValue.optional

      attribute? :employment_type, Types::Array.of(Types::EmploymentType)
      attribute? :partner_employment_type, Types::Array.of(Types::EmploymentType)
      attribute? :ended_employment_within_three_months, Types::YesNoValue.optional
      attribute? :lost_job_in_custody, Types::YesNoValue.optional
      attribute? :date_job_lost, Types::JSON::Date.optional
      attribute? :has_frozen_income_or_assets, Types::YesNoValue.optional
      attribute? :has_savings, Types::YesNoValue.optional
      attribute? :manage_without_income, Types::ManageWithoutIncomeTypes.optional
      attribute? :manage_other_details, Types::String.optional
      attribute? :client_has_dependants, Types::YesNoValue.optional
      attribute? :client_owns_property, Types::YesNoValue.optional
      attribute? :has_no_income_payments, Types::YesNoValue.optional
      attribute? :has_no_income_benefits, Types::YesNoValue.optional
      attribute? :partner_has_no_income_payments, Types::YesNoValue.optional
      attribute? :partner_has_no_income_benefits, Types::YesNoValue.optional
      attribute? :applicant_self_assessment_tax_bill, Types::YesNoValue.optional
      attribute? :applicant_self_assessment_tax_bill_amount, Types::PenceSterling.optional
      attribute? :applicant_self_assessment_tax_bill_frequency, Types::PaymentFrequency.optional
      attribute? :partner_self_assessment_tax_bill, Types::YesNoValue.optional
      attribute? :partner_self_assessment_tax_bill_amount, Types::PenceSterling.optional
      attribute? :partner_self_assessment_tax_bill_frequency, Types::PaymentFrequency.optional
      attribute? :applicant_other_work_benefit_received, Types::YesNoValue.optional
      attribute? :partner_other_work_benefit_received, Types::YesNoValue.optional
      attribute? :employments, Types::Array.of(Employment).default([].freeze)
      attribute? :partner_employments, Types::Array.of(Employment).default([].freeze)

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

      attribute? :income_payments, Types::Coercible::Array.of(Base).default([].freeze) do
        attribute :payment_type, Types::IncomePaymentType
        attribute :ownership_type, Types::OwnershipType
        attributes_from Amount
      end

      attribute? :income_benefits, Types::Coercible::Array.of(Base).default([].freeze) do
        attribute :payment_type, Types::IncomeBenefitType
        attribute :ownership_type, Types::OwnershipType
        attributes_from Amount
      end
    end
  end
end
