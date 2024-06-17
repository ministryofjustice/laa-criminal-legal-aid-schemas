# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Financial < Base
      attribute :financial_type, Types::FinancialType.optional
      attributes_from Amount
    end
  end
end
