# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class NationalSavingsCertificate < Base
      attribute :holder_number, Types::String
      attribute :certificate_number, Types::String
      attribute :value, Types::PenceSterling
      attribute :ownership_type, Types::OwnershipType
    end
  end
end
