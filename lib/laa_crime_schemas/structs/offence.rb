# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Offence < Base
      attribute :name, Types::String
      attribute? :offence_class, Types::String.optional
      attribute :dates, Types::Array.of(Types::JSON::Date).constrained(min_size: 1)
    end
  end
end
