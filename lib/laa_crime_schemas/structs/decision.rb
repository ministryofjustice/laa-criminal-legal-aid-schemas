# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Decision < Base
      attribute? :reference, Types::Integer.optional
      attribute? :maat_id, Types::Integer.optional
      attribute? :case_id, Types::String.optional
      attribute? :interests_of_justice, Types::Nil | TestResult
      attribute? :means, Types::Nil | TestResult
      attribute :funding_decision, Types::FundingDecisionResult
      attribute? :comment, Types::String.optional
    end
  end
end
