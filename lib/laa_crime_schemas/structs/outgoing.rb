# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Outgoing < Base
      attribute :payment_type, Types::OutgoingsType
      attribute :ownership_type, Types::OwnershipType
      attributes_from Amount
    end
  end
end
