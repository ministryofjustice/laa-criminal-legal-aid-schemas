# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class CapitalDetails < Base
      attribute :has_premium_bonds, Types::YesNoValue
      attribute :premium_bonds_total_value, Types::PenceSterling.optional
      attribute :premium_bonds_holder_number, Types::String.optional

      attribute :savings, Types::Array.of(Saving).default([].freeze)
    end
  end
end
