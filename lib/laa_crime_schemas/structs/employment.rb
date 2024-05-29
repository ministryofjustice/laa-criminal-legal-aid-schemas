# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Employment < Base
      attribute :ownership_type, Types::OwnershipType.optional
      attribute :employer_name, Types::String.optional
      attribute :job_title, Types::String.optional
      attribute :has_no_deductions, Types::YesNoValue.optional
      attribute :address, Address.optional
      attributes_from Amount

      attribute? :deductions, Types::Array.of(Deduction).default([].freeze)
    end
  end
end
