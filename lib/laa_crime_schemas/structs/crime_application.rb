# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class CrimeApplication < BaseApplication
      attribute :ioj_passport, Types::Array.of(Types::IojPassportType).default([].freeze)
      attribute :means_passport, Types::Array.of(Types::MeansPassportType).default([].freeze)

      attribute :provider_details, ProviderDetails

      attribute :client_details, Base do
        attribute :applicant, Applicant
      end

      attribute :case_details, CaseDetails

      attribute :interests_of_justice, Types::Coercible::Array.of(Base).default([].freeze) do
        attribute :type, Types::IojType
        attribute :reason, Types::String
      end

      attribute? :return_details, ReturnDetails
    end
  end
end
