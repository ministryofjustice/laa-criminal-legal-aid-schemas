# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class EvidenceDetails < Base
      attribute :last_run_at, Types::JSON::DateTime
      attribute :evidence_prompts, Types::Array.of(Prompt).default([].freeze)
    end
  end
end
