# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class CrimeApplication < BaseApplication
      attribute? :ioj_passport, Types::Array.of(Types::IojPassportType).default([].freeze)
      attribute? :means_passport, Types::Array.of(Types::MeansPassportType).default([].freeze)

      attribute :provider_details, ProviderDetails

      attribute :client_details, Base do
        attribute :applicant, Applicant
      end

      attribute? :case_details, CaseDetails

      attribute? :interests_of_justice, Types::Coercible::Array.of(Base).default([].freeze) do
        attribute :type, Types::IojType
        attribute :reason, Types::String
      end

      attribute? :means_details, MeansDetails

      attribute? :supporting_evidence, Types::Array.of(Document).default([].freeze)

      attribute? :return_details, ReturnDetails

      attribute? :work_stream, Types::WorkStreamType.optional

      attribute? :notes, Types::String.optional
    end
  end
end
