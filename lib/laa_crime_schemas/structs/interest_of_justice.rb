# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class InterestOfJustice < Base
      attribute :type, Types::IojType
      attribute :reason, Types::String
    end
  end
end
