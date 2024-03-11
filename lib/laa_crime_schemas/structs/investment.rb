# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Investment < Base
      attribute :investment_type, Types::InvestmentType
      attribute :description, Types::String
      attribute :value, Types::PenceSterling
      attribute :ownership_type, Types::OwnershipType
    end
  end
end
