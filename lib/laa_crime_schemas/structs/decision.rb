# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Decision < Base
      attribute? :reference, Types::Integer.optional
      attribute? :maat_id, Types::Integer.optional
      attribute? :interests_of_justice, Types::InterestsOfJusticeDecision.optional
      attribute? :means, Types::MeansDecision.optional
      attribute :funding_decision, Types::FundingDecisionResult
      attribute? :comments, Types::String.optional
    end
  end
end
