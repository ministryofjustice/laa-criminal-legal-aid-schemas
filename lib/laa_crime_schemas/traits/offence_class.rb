# frozen_string_literal: true

module LaaCrimeSchemas
  module Traits
    module OffenceClass
      OFFENCE_CLASS_RANKING = %w[
        a
        k
        g
        b
        i
        j
        d
        c
        h
        f
        e
      ].freeze

      def offence_class
        if any_manually_entered?
          nil
        else
          highest_ranking_offence_class
        end
      end

      private

      def highest_ranking_offence_class
        rank_offences.first
      end

      def rank_offences
        offences_classes = attributes[:offences].map(&:offence_class)
        offences_classes.sort_by { |oc| OFFENCE_CLASS_RANKING.index oc.downcase }
      end

      def any_manually_entered?
        attributes[:offences].any? { |o| o.offence_class.nil? }
      end
    end
  end
end
