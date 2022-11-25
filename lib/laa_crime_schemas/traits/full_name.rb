# frozen_string_literal: true

module LaaCrimeSchemas
  module Traits
    module FullName
      NAME_ATTRIBUTES = %i[
        first_name
        last_name
      ].freeze

      def full_name
        attributes.values_at(*NAME_ATTRIBUTES).join(' ')
      end
    end
  end
end
