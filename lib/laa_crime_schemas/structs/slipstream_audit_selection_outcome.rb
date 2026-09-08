# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class SlipstreamAuditSelectionOutcome < Base
      attribute :status, Types::SlipstreamAuditSelectionOutcomeStatus
      attribute :sample_rate, Types::SlipstreamAuditSampleRate
      attribute :sampled_at, Types::JSON::DateTime
      attribute :status_determined_at, Types::JSON::DateTime
    end
  end
end
