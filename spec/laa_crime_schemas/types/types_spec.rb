RSpec.describe LaaCrimeSchemas::Types do
  describe 'Types' do
    context 'for offence class type' do
      it 'uses a valid offence class ranking' do
        expect(LaaCrimeSchemas::Types::OffenceClass.values).to eq( %w[A K G B I J D C H F E].freeze)
      end
    end

    context 'for ownership type' do
      it 'sets applicant as the default' do
        expect(LaaCrimeSchemas::Types::OwnershipType[]).to eq('applicant')
      end
    end

    context "income payments" do
      context 'for OtherIncomePaymentType' do
        it 'returns other income payment types' do
          expect(LaaCrimeSchemas::Types::OtherIncomePaymentType.values).to match_array(%w[
          maintenance
          private_pension
          state_pension
          interest_investment
          student_loan_grant
          board_from_family
          rent
          financial_support_with_access
          from_friends_relatives
          other
        ])
        end
      end

      context 'for EmploymentIncomePaymentType' do
        it 'returns employment income payment types' do
          expect(LaaCrimeSchemas::Types::EmploymentIncomePaymentType.values).to match_array(%w[
          employment
          work_benefits
        ])
        end
      end

      context 'for IncomePaymentType' do
        it 'returns all income payment types' do
          expect(LaaCrimeSchemas::Types::IncomePaymentType.values).to match_array(%w[
            maintenance
            private_pension
            state_pension
            interest_investment
            student_loan_grant
            board_from_family
            rent
            financial_support_with_access
            from_friends_relatives
            other
            employment
            work_benefits
          ])
        end
      end
    end

    context "outgoings payments" do
      context 'for OtherOutgoingsPaymentType' do
        it 'returns all income payment types' do
          expect(LaaCrimeSchemas::Types::OtherOutgoingsPaymentType.values).to match_array(%w[
            rent
            mortgage
            board_and_lodging
            council_tax
            childcare
            maintenance
            legal_aid_contribution
        ])
        end

        context 'for EmploymentOutgoingsPaymentType' do
          it 'returns all employment outgoings payment types' do
            expect(LaaCrimeSchemas::Types::EmploymentOutgoingsPaymentType.values).to match_array(%w[
              self_assessment_tax_bill
          ])
          end
        end

        context 'for OutgoingsType' do
          it 'returns all outgoings payment types' do
            expect(LaaCrimeSchemas::Types::OutgoingsType.values).to match_array(%w[
              rent
              mortgage
              board_and_lodging
              council_tax
              childcare
              maintenance
              legal_aid_contribution
              self_assessment_tax_bill
          ])
          end
        end
      end

    end

    context "income benefits" do
      context 'for IncomeBenefitType' do
        it 'returns all income payment types' do
          expect(LaaCrimeSchemas::Types::IncomeBenefitType.values).to match_array(%w[
            child
            working_or_child_tax_credit
            incapacity
            industrial_injuries_disablement
            jsa
            other
          ])
        end
      end
    end
  end
end
