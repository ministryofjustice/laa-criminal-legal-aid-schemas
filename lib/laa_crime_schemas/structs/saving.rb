# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Saving < Base
      attribute :saving_type, Types::SavingType
      attribute? :provider_name, Types::String.optional
      attribute? :account_balance, Types::PenceSterling.optional
      attribute? :sort_code, Types::String.optional
      attribute? :account_number, Types::String.optional
      attribute? :is_overdrawn, Types::YesNoValue.optional
      attribute? :are_wages_paid_into_account, Types::YesNoValue.optional
      attribute? :are_partners_wages_paid_into_account, Types::YesNoValue.optional
      attribute? :ownership_type, Types::OwnershipType.optional
    end
  end
end
