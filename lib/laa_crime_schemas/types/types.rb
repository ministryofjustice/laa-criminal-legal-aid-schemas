# frozen_string_literal: true

# rubocop:disable Metrics/ModuleLength

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

    APPLICATION_TYPES = %w[
      initial
      post_submission_evidence
      change_in_financial_circumstances
    ].freeze
    ApplicationType = String.enum(*APPLICATION_TYPES)

    APPLICATION_STATUSES = %w[
      submitted
      returned
      superseded
    ].freeze
    ApplicationStatus = String.enum(*APPLICATION_STATUSES)

    AssetType = String.enum(%w[valuable_items money_overseas timeshare land interest])

    BENEFIT_TYPES = %w[
      universal_credit
      guarantee_pension
      jsa
      esa
      income_support
      none
    ].freeze
    BenefitType = String.enum(*BENEFIT_TYPES)

    OtherBenefitType = String.enum(
      *%w[
        child
        working_or_child_tax_credit
        universal_credit
        incapacity
        industrial_injuries_disablement
        jsa
        other
      ]
    )

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

    FIRST_HEARING_ANSWER_VALUES = %w[
      yes
      no
      no_hearing_yet
    ].freeze
    FirstHearingAnswerValues = String.enum(*FIRST_HEARING_ANSWER_VALUES)

    IncomePaymentType = String.enum(*%w[
                                      private_pension
                                      state_pension
                                      maintenance
                                      interest_investment
                                      student_loan_grant
                                      board_from_family
                                      rent
                                      financial_support_with_access
                                      from_friends_relatives
                                      other
                                    ])

    OutgoingsType = String.enum(*%w[
                                  housing
                                  council_tax
                                  childcare
                                  maintenance
                                  legal_aid
                                ])
    HOUSING_PAYMENT_TYPES = %w[
      rent
      mortgage
      board_lodgings
      none
    ].freeze
    HousingPaymentType = String.enum(*HOUSING_PAYMENT_TYPES)

    PaymentFrequency = String.enum(
      *%w[week fortnight four_weeks month annual]
    )

    PenceSterling = Integer

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
      on_offence
    ].freeze
    IojPassportType = String.enum(*IOJ_PASSPORT_TYPES)

    MEANS_PASSPORT_TYPES = %w[
      on_not_means_tested
      on_age_under18
      on_benefit_check
    ].freeze
    MeansPassportType = String.enum(*MEANS_PASSPORT_TYPES)

    MANAGE_WITHOUT_INCOME_TYPES = %w[
      friends_sofa
      family
      living_on_streets
      custody
      other
    ].freeze
    ManageWithoutIncomeTypes = String.enum(*MANAGE_WITHOUT_INCOME_TYPES)

    RETURN_REASONS = %w[
      clarification_required
      evidence_issue
      duplicate_application
      case_concluded
      provider_request
      split_case
    ].freeze
    ReturnReason = String.enum(*RETURN_REASONS)

    REVIEW_APPLICATION_STATUSES = %w[
      application_received
      returned_to_provider
      ready_for_assessment
      assessment_completed
    ].freeze
    ReviewApplicationStatus = String.enum(*REVIEW_APPLICATION_STATUSES)

    OFFENCE_CLASSES = %w[A K G B I J D C H F E].freeze
    OffenceClass = String.enum(*OFFENCE_CLASSES)

    OwnershipType = String.enum(*%w[with_partner landlord other_person sole])

    SavingsType = String.enum(*%w[
                                cash
                                other_person_account
                                certificates
                                shares
                                trusts
                                policies
                              ])

    EmploymentStatusType = String.enum(*%w[employed self-employed none])

    EmploymentType = String.enum(*%w[employed self-employed business_partnership director shareholder not_working])

    DependantAge = Integer.constrained(lt: 18)

    # `awaiting` before a file has been scanned
    # `incomplete` if virus scan never finished e.g. timeout
    # `other` for unknown/unsupported scan results
    VIRUS_SCAN_STATUSES = %w[
      awaiting
      pass
      flagged
      incomplete
      other
    ].freeze

    VirusScanStatus = String.default('awaiting').enum(*VIRUS_SCAN_STATUSES)

    WORK_STREAM_TYPES = %w[
      criminal_applications_team
      criminal_applications_team_2
      extradition
    ].freeze
    WorkStreamType = Coercible::String.enum(*WORK_STREAM_TYPES)
  end
end
# rubocop:enable Metrics/ModuleLength
