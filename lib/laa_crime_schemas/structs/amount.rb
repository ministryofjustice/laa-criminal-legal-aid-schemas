# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Amount < Base
      attribute :amount, Types::PenceSterling
      attribute :frequency, Types::PaymentFrequency
      attribute :ownership_type, Types::OwnershipType

      attribute? :metadata do
        attribute? :details, Types::String.optional

        # Used by legal_aid_contribution
        attribute? :case_reference, Types::String.optional

        # Used by board_and_lodging
        attribute? :board_amount, Types::PenceSterling
        attribute? :food_amount, Types::PenceSterling
        attribute? :payee_name, Types::String.optional
        attribute? :payee_relationship_to_client, Types::String.optional
      end
    end
  end
end
