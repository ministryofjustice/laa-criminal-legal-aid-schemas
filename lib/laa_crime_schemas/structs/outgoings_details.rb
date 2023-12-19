# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class OutgoingsDetails < Base
      attribute? :outgoings, Types::Array.of(Base) do
        attribute :type, Types::OutgoingsType
        attributes_from Amount
      end
      attribute? :outgoings_more_than_income, Types::YesNoValue.optional
      attribute? :how_manage, Types::String.optional
    end
  end
end
