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

      it 'builds from the example json' do
        expect(struct.employment_status).to eq('employed')
      end

      describe 'storing income details' do 
        subject(:income_details) { struct.income_details }

        it 'includes income total' do
          expect(income_details.total).to eq(1370380)
        end

        it 'records the frequency of benefits' do
          expect(income_details.benefits.first.frequency).to eq('month')
        end
      end

      describe 'storing outgoings details' do
        subject(:outgoings_details) { struct.outgoings_details }

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
