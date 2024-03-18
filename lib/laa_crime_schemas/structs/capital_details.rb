# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class CapitalDetails < Base
      attribute? :has_premium_bonds, Types::YesNoValue
      attribute? :premium_bonds_total_value, Types::PenceSterling.optional
      attribute? :premium_bonds_holder_number, Types::String.optional

      attribute? :will_benefit_from_trust_fund, Types::YesNoValue
      attribute? :trust_fund_amount_held, Types::PenceSterling.optional
      attribute? :yearly_dividend, Types::PenceSterling.optional

      attribute? :savings, Types::Array.of(Saving).default([].freeze)
      attribute? :properties, Types::Array.of(Property).default([].freeze)
      attribute? :investments, Types::Array.of(Investment).default([].freeze)
      attribute? :national_savings_certificates, Types::Array.of(NationalSavingsCertificate).default([].freeze)

      attribute? :has_frozen_income_or_assets, Types::YesNoValue.optional
    end
  end
end
