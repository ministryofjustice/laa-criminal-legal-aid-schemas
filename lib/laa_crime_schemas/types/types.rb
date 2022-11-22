# frozen_string_literal: true

module Types
  include Dry.Types()

  SchemaVersion = Coercible::Float
  ApplicationReference = Coercible::Integer

  YESNO_VALUES = %w[
    yes
    no
  ].freeze
  YesNoValue = String.enum(*YESNO_VALUES)

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

  CASE_TYPES = %w[
    summary_only
    either_way
    indictable
    already_in_crown_court
    committal
    appeal_to_crown_court
    appeal_to_crown_court_with_changes
  ].freeze
  CaseType = String.enum(*CASE_TYPES)
end
