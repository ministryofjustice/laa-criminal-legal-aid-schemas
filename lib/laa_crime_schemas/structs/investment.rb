# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Investment < Base
      attribute :investment_type, Types::InvestmentType
      attribute? :description, Types::String.optional
      attribute? :value, Types::PenceSterling.optional
      attribute :ownership_type, Types::OwnershipType.optional
    end
  end
end
