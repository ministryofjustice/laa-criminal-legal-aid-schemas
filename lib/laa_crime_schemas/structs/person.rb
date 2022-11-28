# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Person < Base
      include Traits::FullName

      attribute :first_name, Types::String
      attribute :last_name, Types::String
      attribute? :other_names, Types::String.optional
    end
  end
end
