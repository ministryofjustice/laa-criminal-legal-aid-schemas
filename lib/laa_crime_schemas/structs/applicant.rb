# frozen_string_literal: true

module LaaCrimeSchemas
  module Structs
    class Applicant < Person
      attribute :date_of_birth, Types::JSON::Date
      attribute? :benefit_type, Types::BenefitType.optional
      attribute? :last_jsa_appointment_date, Types::JSON::Date.optional
      attribute? :has_nino, Types::String.optional
      attribute? :nino, Types::String.optional
      attribute? :home_address, Address.optional
      attribute? :correspondence_address, Address.optional
      attribute? :correspondence_address_type, Types::CorrespondenceAddressType.optional
      attribute? :telephone_number, Types::String.optional
      attribute? :residence_type, Types::ResidenceType.optional
      attribute? :relationship_to_owner_of_usual_home_address, Types::String.optional

      attribute? :passporting_benefit, Types::Bool.optional
      attribute? :has_benefit_evidence, Types::String.optional
      attribute? :will_enter_nino, Types::String.optional
      attribute? :confirm_details, Types::String.optional
      attribute? :confirm_dwp_result, Types::String.optional

      attribute? :has_partner, Types::String.optional
      attribute? :relationship_to_partner, Types::RelationshipType.optional
      attribute? :separation_date, Types::JSON::Date.optional
      attribute? :relationship_status, Types::RelationshipStatus.optional
    end
  end
end
