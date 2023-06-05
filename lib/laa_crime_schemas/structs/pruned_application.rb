# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class PrunedApplication < BaseApplication
      attribute :client_details, Base do
        attribute :applicant, Person
      end
    end
  end
end
