# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Amount < Base
      attribute :amount, Types::PenceSterling
      attribute :frequency, Types::PaymentFrequency

      attribute? :metadata do
        attribute? :details, Types::String.optional
        attribute? :case_reference, Types::String.optional
      end
    end
  end
end
