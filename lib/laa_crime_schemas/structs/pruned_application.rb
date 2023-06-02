# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class PrunedApplication < Base
      attribute :id, Types::String
      attribute :parent_id, Types::String.optional
      attribute :schema_version, Types::SchemaVersion
      attribute :reference, Types::ApplicationReference
      attribute :application_type, Types::ApplicationType
      attribute :created_at, Types::JSON::DateTime
      attribute :submitted_at, Types::JSON::DateTime
      attribute? :returned_at, Types::JSON::DateTime
      attribute :status, Types::ApplicationStatus

      attribute :client_details, Base do
        attribute :applicant, Person
      end
    end
  end
end
