# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Base < Dry::Struct
      # convert string keys to symbols
      transform_keys(&:to_sym)

      def to_json(*args)
        to_h.to_json(*args)
      end
    end
  end
end
