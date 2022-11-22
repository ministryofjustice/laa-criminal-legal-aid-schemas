# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Codefendant < Base
      attribute :created_at, Types::JSON::DateTime
      attribute :first_name, Types::String
      attribute :last_name, Types::String
      attribute :conflict_of_interest, Types::YesNoValue
    end
  end
end
