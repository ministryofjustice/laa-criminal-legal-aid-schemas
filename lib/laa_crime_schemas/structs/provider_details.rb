# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class ProviderDetails < Base
      attribute :office_code, Types::String
      attribute :provider_email, Types::String
      attribute :legal_rep_first_name, Types::String
      attribute :legal_rep_last_name, Types::String
      attribute :legal_rep_telephone, Types::String
    end
  end
end
