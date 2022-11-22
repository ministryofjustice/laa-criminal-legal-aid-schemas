# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class CrimeApplication < Base
      attribute :id, Types::String
      attribute :schema_version, Types::SchemaVersion
      attribute :reference, Types::ApplicationReference
      attribute :created_at, Types::JSON::DateTime
      attribute :submitted_at, Types::JSON::DateTime
      attribute :date_stamp, Types::JSON::DateTime
      attribute :status, Types::ApplicationStatus

      attribute :client_details, Base do
        attribute :applicant, Person
      end
    end
  end
end
