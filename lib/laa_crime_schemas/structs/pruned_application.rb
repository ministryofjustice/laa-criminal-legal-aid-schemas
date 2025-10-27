# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class PrunedApplication < Base
      # submission attributes
      attribute :id, Types::String
      attribute :parent_id, Types::String.optional
      attribute :schema_version, Types::SchemaVersion
      attribute :reference, Types::ApplicationReference
      attribute :application_type, Types::ApplicationType
      attribute :client_details, Base do
        attribute :applicant, Person
      end
      attribute :created_at, Types::JSON::DateTime
      attribute :submitted_at, Types::JSON::DateTime.optional
      attribute? :date_stamp, Types::JSON::DateTime.optional

      # datastore attributes
      attribute? :returned_at, Types::JSON::DateTime.optional
      attribute? :review_status, Types::ReviewApplicationStatus
      attribute? :reviewed_at, Types::JSON::DateTime.optional
      attribute? :status, Types::ApplicationStatus
      attribute? :work_stream, Types::WorkStreamType.optional
    end
  end
end
