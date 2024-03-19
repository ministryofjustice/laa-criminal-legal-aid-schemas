# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class PropertyOwner < Base
      attribute :name, Types::String
      attribute :relationship, Types::RelationshipType
      attribute :custom_relationship, Types::String.optional
      attribute :percentage_owned, Types::Float
    end
  end
end
