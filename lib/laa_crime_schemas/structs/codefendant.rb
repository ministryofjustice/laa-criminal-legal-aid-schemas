# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Codefendant < Person
      attribute :conflict_of_interest, Types::YesNoValue
    end
  end
end
