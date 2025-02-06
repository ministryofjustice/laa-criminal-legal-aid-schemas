# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Decision < Base
      attribute? :reference, Types::Integer.optional
      attribute? :maat_id, Types::Integer.optional
      attribute? :case_id, Types::String.optional
      attribute? :assessment_rules, Types::AssessmentRules.optional
      attribute? :interests_of_justice, Types::Nil | TestResult
      attribute? :means, Types::Nil | TestResult
      attribute? :funding_decision, Types::FundingDecision.optional
      attribute? :overall_result, Types::OverallResult.optional
      attribute? :comment, Types::String.optional
    end
  end
end
