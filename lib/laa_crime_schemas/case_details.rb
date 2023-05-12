# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class CaseDetails < Base
      attribute :urn, Types::String.optional
      attribute :case_type, Types::CaseType
      attribute? :appeal_maat_id, Types::String.optional
      attribute? :appeal_with_changes_maat_id, Types::String.optional
      attribute? :appeal_with_changes_details, Types::String.optional

      attribute :offences, Types::Array.of(Offence).constrained(min_size: 1)
      attribute :codefendants, Types::Array.of(Codefendant).default([].freeze)

      attribute :hearing_court_name, Types::String
      attribute :hearing_date, Types::JSON::Date
    end
  end
end
