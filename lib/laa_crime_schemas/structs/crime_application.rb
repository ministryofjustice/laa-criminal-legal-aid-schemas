# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class CrimeApplication < BaseApplication
      attribute? :is_means_tested, Types::String.optional
      attribute? :ioj_passport, Types::Coercible::Array.of(Types::IojPassportType).default([].freeze)
      attribute? :means_passport, Types::Coercible::Array.of(Types::MeansPassportType).default([].freeze)

      attribute? :provider_details, ProviderDetails.optional

      attribute? :client_details, Base do
        attribute? :applicant, Applicant.optional
        attribute? :partner, Partner.optional
      end

      attribute? :case_details, CaseDetails.optional

      attribute? :interests_of_justice, Types::Coercible::Array.of(Base).default([].freeze) do
        attribute? :type, Types::IojType.optional
        attribute? :reason, Types::String.optional
      end

      attribute? :means_details, MeansDetails.optional

      attribute? :supporting_evidence, Types::Coercible::Array.of(Document).default([].freeze)
      attribute? :evidence_details, EvidenceDetails.optional

      attribute? :return_details, ReturnDetails.optional

      attribute? :work_stream, Types::WorkStreamType.optional

      attribute? :additional_information, Types::String.optional

      attribute? :pre_cifc_reference_number, Types::String.optional
      attribute? :pre_cifc_maat_id, Types::String.optional
      attribute? :pre_cifc_usn, Types::String.optional
      attribute? :pre_cifc_reason, Types::String.optional

      attribute? :decisions, Types::Coercible::Array.of(Decision).default([].freeze)
    end
  end
end
