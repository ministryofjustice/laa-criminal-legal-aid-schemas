# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Base < Dry::Struct
      # convert string keys to symbols
      transform_keys(&:to_sym)
    end
  end
end
