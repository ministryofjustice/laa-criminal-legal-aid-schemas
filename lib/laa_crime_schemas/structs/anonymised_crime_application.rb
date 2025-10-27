# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class AnonymisedCrimeApplication < Base
      # Retains only non-personally identifiable information and
      # converts submission timestamps to dates to enhance anonymisation.office_code
      attribute :id, Types::String
      attribute :parent_id, Types::String.optional
      attribute :schema_version, Types::SchemaVersion
      attribute :reference, Types::ApplicationReference
      attribute :application_type, Types::ApplicationType
      attribute :client_details do
        attribute(:applicant, Applicant.constructor { { last_name: '[deleted]' } })
      end
      attribute :created_at, Types::JSON::Date
      attribute :provider_details do
        attribute :office_code, Types::String
      end
      attribute :submitted_at, Types::JSON::Date.optional
      attribute? :date_stamp, Types::JSON::Date.optional
      attribute? :ioj_passport, Types::Array.of(Types::IojPassportType).default([].freeze)
      attribute? :means_passport, Types::Array.of(Types::MeansPassportType).default([].freeze)

      # datastore attributes
      attribute? :returned_at, Types::JSON::DateTime.optional
      attribute? :review_status, Types::ReviewApplicationStatus
      attribute? :reviewed_at, Types::JSON::DateTime.optional
      attribute? :soft_deleted_at, Types::JSON::DateTime.optional
      attribute? :status, Types::ApplicationStatus
      attribute? :work_stream, Types::WorkStreamType
    end
  end
end
