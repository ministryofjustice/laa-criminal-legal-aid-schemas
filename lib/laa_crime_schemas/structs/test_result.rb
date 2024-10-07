# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class TestResult < Base
      attribute :result, Types::TestResult
      attribute? :details, Types::String.optional
      attribute :assessed_by, Types::String
      attribute :assessed_on, Types::JSON::Date
    end
  end
end
