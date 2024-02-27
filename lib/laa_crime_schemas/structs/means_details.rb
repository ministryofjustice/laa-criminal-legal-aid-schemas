# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class MeansDetails < Base
      attribute? :income_details, IncomeDetails
      attribute? :outgoings_details, OutgoingsDetails
      attribute? :capital_details, CapitalDetails
    end
  end
end
