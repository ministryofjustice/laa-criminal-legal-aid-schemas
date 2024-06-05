# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Deduction < Base
      attribute :deduction_type, Types::DeductionType.optional
      attribute :details, Types::String.optional
      attributes_from Amount
    end
  end
end
