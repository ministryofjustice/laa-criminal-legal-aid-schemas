# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Prompt < Base
      attribute  :id, Types::String
      attribute  :group, Types::String
      attribute  :ruleset, Types::String
      attribute  :key, Types::String
      attribute  :run do
        attribute :client do
          attribute :result, Types::Bool
          attribute :prompt, Types::Array.of(Types::String).default([].freeze)
        end

        attribute :partner do
          attribute :result, Types::Bool
          attribute :prompt, Types::Array.of(Types::String).default([].freeze)
        end

        attribute :other do
          attribute :result, Types::Bool
          attribute :prompt, Types::Array.of(Types::String).default([].freeze)
        end
      end
    end
  end
end
