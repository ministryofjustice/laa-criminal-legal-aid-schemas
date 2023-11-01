# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Asset < Base
      attribute :value, Types::PenceSterling
      attribute :liability, Types::PenceSterling.default(0)
      attribute? :details, Types::String.optional
    end
  end
end
