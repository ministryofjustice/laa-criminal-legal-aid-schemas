RSpec.describe LaaCrimeSchemas::Structs::MeansDetails do
  describe 'schema version 1.0' do
    let(:valid_fixture) { 'application/1.0/means.json' }
    let(:schema_name) { 'means' }
    let(:version) { 1.0 }
    let(:schema_title) { 'Means attributes for a criminal legal aid application' }

    it_behaves_like 'a struct aligned to its json schema'

    context 'when initialised with valid means details' do
      subject(:struct) { described_class.new(attributes) }

      let(:attributes) do
        JSON.parse(file_fixture(valid_fixture).read)
      end

      describe 'storing income details' do
        subject(:income_details) { struct.income_details }

        context 'with income payments' do
          let(:income_payment) { income_details.income_payments.first }

          it 'allows valid data' do
            expect(income_payment.payment_type).to eq 'other'
            expect(income_payment.amount).to eq 2500
            expect(income_payment.frequency).to eq 'annual'
            expect(income_payment.metadata.details).to eq 'Book royalty'
          end
        end

        context 'with income benefits' do
          let(:income_benefit) { income_details.income_benefits.first }

          it 'allows valid data' do
            expect(income_benefit.payment_type).to eq 'child'
            expect(income_benefit.amount).to eq 3990
            expect(income_benefit.frequency).to eq 'month'
            expect(income_benefit.metadata).to be_nil
          end
        end
      end

      describe 'storing outgoings details' do
        subject(:outgoings_details) { struct.outgoings_details }

        it 'includes income_tax_rate_above_threshold' do
          expect(outgoings_details.income_tax_rate_above_threshold).to eq('no')
        end

        it 'includes outgoings_more_than_income' do
          expect(outgoings_details.outgoings_more_than_income).to eq('yes')
        end
      end

      it 'produces a valid JSON document conforming to the schema' do
        validator = LaaCrimeSchemas::Validator.new(
            struct.to_json,
            version: 1.0,
            schema_name:
        )

        expect(validator).to be_valid, validator.fully_validate
      end
    end
  end
end
