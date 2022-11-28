# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class CrimeApplication < Base
      attribute :id, Types::String
      attribute :schema_version, Types::SchemaVersion
      attribute :reference, Types::ApplicationReference
      attribute? :application_type, Types::String
      attribute :created_at, Types::JSON::DateTime
      attribute :submitted_at, Types::JSON::DateTime
      attribute :date_stamp, Types::JSON::DateTime
      attribute :status, Types::ApplicationStatus

      attribute :provider_details, Base do
        # TBD, requires Portal integration
      end

      attribute :client_details, Base do
        attribute :applicant, Applicant
      end

      attribute :case_details, Base do
        attribute :urn, Types::String.optional

        attribute :case_type, Types::CaseType
        attribute? :appeal_maat_id, Types::String.optional
        attribute? :appeal_with_changes_maat_id, Types::String.optional
        attribute? :appeal_with_changes_details, Types::String.optional

        attribute :offences, Types::Array.of(Offence)
        attribute :codefendants, Types::Array.of(Codefendant).default([].freeze)

        attribute :hearing_court_name, Types::String
        attribute :hearing_date, Types::JSON::Date
      end

      attribute :interests_of_justice, Types::Array.of(Base).default([].freeze) do
        attribute :type, Types::IojType
        attribute :reason, Types::String
      end
    end
  end
end
