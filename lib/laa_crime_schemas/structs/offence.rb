# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Offence < Base
      attribute :name, Types::String

      attribute :offence_class, Types::OffenceClass.optional

      # Once all applications in datastore have the `slipstreamable`
      # attribute, we can mark it as mandatory
      attribute? :slipstreamable, Types::Bool

      attribute :dates, Types::Array.of(Base).constrained(min_size: 1) do
        attribute :date_from, Types::JSON::Date
        attribute :date_to, Types::JSON::Date.optional
      end
    end
  end
end
