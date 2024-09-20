# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class DateStampContext < Base
      attribute? :first_name, Types::String.optional
      attribute? :last_name, Types::String.optional
      attribute? :date_of_birth, Types::JSON::Date.optional
      attribute? :created_at, Types::JSON::DateTime.optional
      attribute? :date_stamp, Types::JSON::DateTime.optional
    end
  end
end
