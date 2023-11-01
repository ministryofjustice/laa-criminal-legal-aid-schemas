# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Amount < Base
      attribute :amount, Types::PenceSterling
      attribute :frequency, Types::PaymentFrequency
      attribute? :details, Types::String.optional
    end
  end
end
