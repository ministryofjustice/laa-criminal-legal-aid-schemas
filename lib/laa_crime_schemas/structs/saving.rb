# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Saving < Base
      attribute :saving_type, Types::SavingType
      attribute :provider_name, Types::String
      attribute :account_balance, Types::PenceSterling
      attribute :sort_code, Types::String
      attribute :account_number, Types::String
      attribute :is_overdrawn, Types::YesNoValue
      attribute :are_wages_paid_into_account, Types::YesNoValue
      attribute :ownership_type, Types::OwnershipType
    end
  end
end
