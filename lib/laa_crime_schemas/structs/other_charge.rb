# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class OtherCharge < Base
      attribute :charge, Types::String.optional
      attribute :hearing_court_name, Types::String.optional
      attribute :next_hearing_date, Types::JSON::Date.optional
    end
  end
end
