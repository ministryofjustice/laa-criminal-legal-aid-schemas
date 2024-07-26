# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class NationalSavingsCertificate < Base
      attribute? :holder_number, Types::String.optional
      attribute? :certificate_number, Types::String.optional
      attribute? :value, Types::PenceSterling.optional
      attribute :ownership_type, Types::OwnershipType
    end
  end
end
