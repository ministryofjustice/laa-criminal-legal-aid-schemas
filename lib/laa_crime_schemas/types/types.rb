# frozen_string_literal: true

module LaaCrimeSchemas
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

    INTEREST_OF_JUSTICE_TYPES = %w[
      loss_of_liberty
      suspended_sentence
      loss_of_livelihood
      reputation
      question_of_law
      understanding
      witness_tracing
      expert_examination
      interest_of_another
      other
    ].freeze
    IojType = String.enum(*INTEREST_OF_JUSTICE_TYPES)

    IOJ_PASSPORT_TYPES = %w[
      on_age_under18
      on_case_type
      on_offence
    ].freeze
    IojPassportType = String.enum(*IOJ_PASSPORT_TYPES)

    REVIEW_APPLICATION_STATUSES = %w[
      application_received
      returned_to_provider
      ready_for_assessment
    ].freeze
    ReviewApplicationStatus = String.enum(*REVIEW_APPLICATION_STATUSES)
  end
end
