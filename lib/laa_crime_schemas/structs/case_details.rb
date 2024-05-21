# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class CaseDetails < Base
      attribute? :urn, Types::String.optional
      attribute? :case_type, Types::CaseType.optional

      # Injected by the datastore, not part of the stored application JSON
      attribute? :offence_class, Types::OffenceClass.optional

      attribute? :appeal_lodged_date, Types::JSON::Date.optional
      attribute? :appeal_original_app_submitted, Types::YesNoValue.optional
      attribute? :appeal_financial_circumstances_changed, Types::YesNoValue.optional
      attribute? :appeal_with_changes_details, Types::String.optional
      attribute? :appeal_reference_number, Types::String.optional
      attribute :appeal_maat_id, Types::String.optional
      attribute? :appeal_usn, Types::String.optional

      attribute? :has_case_concluded, Types::YesNoValue.optional
      attribute? :date_case_concluded, Types::JSON::Date.optional

      attribute? :is_client_remanded, Types::YesNoValue.optional
      attribute? :date_client_remanded, Types::JSON::Date.optional

      attribute? :is_preorder_work_claimed, Types::YesNoValue.optional
      attribute? :preorder_work_date, Types::JSON::Date.optional
      attribute? :preorder_work_details, Types::String.optional

      attribute :offences, Types::Array.of(Offence).constrained(min_size: 1)
      attribute :codefendants, Types::Array.of(Codefendant).default([].freeze)

      attribute? :hearing_court_name, Types::String.optional
      attribute? :hearing_date, Types::JSON::Date.optional

      attribute? :is_first_court_hearing, Types::FirstHearingAnswerValues.optional
      attribute? :first_court_hearing_name, Types::String.optional
    end
  end
end
