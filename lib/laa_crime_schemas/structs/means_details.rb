# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class MeansDetails < Base
      attribute? :income_details, IncomeDetails
      attribute? :outgoings_details, OutgoingsDetails

      attribute? :capital_details do
        attribute :houses, Types::Array.of(Base) do
          attribute :ownership_type, Types::OwnershipType
          attribute :share, Types::Float
          attributes_from Asset
        end

        attribute :vehicles, Types::Array.of(Base) do
          attribute :regular_use, Types::Bool
          attribute :purchased_over_three_years_ago, Types::Bool
          attributes_from Asset
        end

        attribute :savings, Types::Array.of(Base) do
          attribute :type, Types::SavingsType
          attributes_from Asset
        end

        attribute :assets, Types::Array.of(Base) do
          attribute :type, Types::AssetType
          attributes_from Asset
        end

        attribute :total, Types::Float
      end
    end
  end
end
