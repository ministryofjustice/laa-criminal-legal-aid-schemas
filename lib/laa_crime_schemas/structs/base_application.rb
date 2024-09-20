# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class BaseApplication < Base
      # Basic attributes shared across a `full` application
      # representation and a `pruned` one. Anything else
      # should go into their individual structs.
      #
      attribute :id, Types::String
      attribute :parent_id, Types::String.optional
      attribute :schema_version, Types::SchemaVersion
      attribute :reference, Types::ApplicationReference
      attribute :application_type, Types::ApplicationType
      attribute? :status, Types::ApplicationStatus

      attribute :created_at, Types::JSON::DateTime
      attribute :submitted_at, Types::JSON::DateTime.optional
      attribute? :date_stamp, Types::JSON::DateTime.optional
      attribute? :date_stamp_context, DateStampContext
      attribute? :returned_at, Types::JSON::DateTime.optional
      attribute? :reviewed_at, Types::JSON::DateTime.optional
    end
  end
end
