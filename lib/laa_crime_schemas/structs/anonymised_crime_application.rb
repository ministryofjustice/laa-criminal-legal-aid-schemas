# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class AnonymisedCrimeApplication < Base
      attribute :id, Types::String
      attribute :parent_id, Types::String.optional
      attribute :schema_version, Types::SchemaVersion
      attribute :reference, Types::ApplicationReference
      attribute :application_type, Types::ApplicationType

      attribute? :ioj_passport, Types::Array.of(Types::IojPassportType).default([].freeze)
      attribute? :means_passport, Types::Array.of(Types::MeansPassportType).default([].freeze)
      attribute? :review_status, Types::ReviewApplicationStatus

      # Transform DateTime into Date to further anonymisation
      attribute :created_at, Types::JSON::Date
      attribute :submitted_at, Types::JSON::Date.optional
      attribute? :date_stamp, Types::JSON::Date.optional

      attribute :provider_details do
        attribute :office_code, Types::String
      end

      attribute :client_details do
        attribute(:applicant, Applicant.constructor { { last_name: '[deleted]' } })
      end
    end
  end
end
