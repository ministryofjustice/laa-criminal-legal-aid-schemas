# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Partner < Person
      attribute? :date_of_birth, Types::JSON::Date.optional
      attribute? :benefit_type, Types::BenefitType.optional
      attribute? :last_jsa_appointment_date, Types::JSON::Date.optional
      attribute? :has_arc, Types::String.optional
      attribute? :has_nino, Types::String.optional
      attribute? :nino, Types::String.optional
      attribute? :arc, Types::String.optional
      attribute? :home_address, Address.optional

      attribute? :benefit_check_result, Types::Bool.optional
      attribute? :benefit_check_status, Types::BenefitCheckStatus.optional
      attribute? :has_benefit_evidence, Types::String.optional
      attribute? :will_enter_nino, Types::String.optional
      attribute? :confirm_details, Types::String.optional
      attribute? :confirm_dwp_result, Types::String.optional
      attribute? :dwp_response, Types::String.optional

      attribute? :involvement_in_case, Types::CaseInvolvement.optional
      attribute? :conflict_of_interest, Types::YesNoValue.optional
      attribute? :has_same_address_as_client, Types::YesNoValue.optional

      attribute? :is_included_in_means_assessment, Types::Bool.optional
    end
  end
end
