# frozen_string_literal: true

module Types
  include Dry.Types()

  SchemaVersion = Coercible::Float
  ApplicationReference = Coercible::Integer

  APPLICATION_STATUSES = %w[
    submitted
    returned
  ].freeze
  ApplicationStatus = String.enum(*APPLICATION_STATUSES)

  CORRESPONDENCE_ADDRESS_TYPES = %w[
    other_address
    home_address
    providers_office_address
  ].freeze
  CorrespondenceAddressType = String.enum(*CORRESPONDENCE_ADDRESS_TYPES)
end
