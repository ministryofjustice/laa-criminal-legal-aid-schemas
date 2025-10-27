# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class CrimeApplication < Base
      # submission attributes
      attribute :id, Types::String
      attribute :parent_id, Types::String.optional
      attribute :schema_version, Types::SchemaVersion
      attribute :reference, Types::ApplicationReference
      attribute :application_type, Types::ApplicationType
      attribute :client_details, Base do
        attribute :applicant, Applicant
        attribute? :partner, Partner
      end
      attribute :created_at, Types::JSON::DateTime
      attribute :provider_details, ProviderDetails
      attribute :submitted_at, Types::JSON::DateTime.optional
      attribute? :case_details, CaseDetails
      attribute? :additional_information, Types::String.optional
      attribute? :date_stamp, Types::JSON::DateTime.optional
      attribute? :date_stamp_context, DateStampContext
      attribute? :evidence_details, EvidenceDetails
      attribute? :interests_of_justice, Types::Coercible::Array.of(Base).default([].freeze) do
        attribute :type, Types::IojType
        attribute :reason, Types::String
      end
      attribute? :ioj_passport, Types::Array.of(Types::IojPassportType).default([].freeze)
      attribute? :is_means_tested, Types::String.optional
      attribute? :means_details, MeansDetails
      attribute? :means_passport, Types::Array.of(Types::MeansPassportType).default([].freeze)
      attribute? :pre_cifc_maat_id, Types::String.optional
      attribute? :pre_cifc_reason, Types::String.optional
      attribute? :pre_cifc_reference_number, Types::String.optional
      attribute? :pre_cifc_usn, Types::String.optional
      attribute? :supporting_evidence, Types::Array.of(Document).default([].freeze)

      # datastore attributes
      attribute? :decisions, Types::Array.of(Decision).default([].freeze)
      attribute? :return_details, ReturnDetails
      attribute? :returned_at, Types::JSON::DateTime.optional
      attribute? :review_status, Types::ReviewApplicationStatus
      attribute? :reviewed_at, Types::JSON::DateTime.optional
      attribute? :soft_deleted_at, Types::JSON::DateTime.optional
      attribute? :status, Types::ApplicationStatus
      attribute? :work_stream, Types::WorkStreamType
    end
  end
end
