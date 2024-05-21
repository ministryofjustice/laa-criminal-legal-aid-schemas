# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class ProviderDetails < Base
      attribute :office_code, Types::String.optional
      attribute :provider_email, Types::String.optional
      attribute :legal_rep_first_name, Types::String.optional
      attribute :legal_rep_last_name, Types::String.optional
      attribute :legal_rep_telephone, Types::String.optional
    end
  end
end
