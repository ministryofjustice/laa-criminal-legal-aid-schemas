# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Person < Base
      include Traits::FullName

      attribute :first_name, Types::String
      attribute :last_name, Types::String

      # This struct is used via composition in other structs
      # like `codefendant`, `applicant` and potentially in the
      # future `partner`, and not all of them ask `other_names`,
      # thus the attribute presence is optional (and value too).
      attribute? :other_names, Types::String.optional
    end
  end
end
