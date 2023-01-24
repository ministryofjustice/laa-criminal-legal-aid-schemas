# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class ReturnDetails < Base
      attribute :reason, Types::ReturnReason
      attribute :details, Types::String
      attribute :returned_at, Types::JSON::DateTime
    end
  end
end
