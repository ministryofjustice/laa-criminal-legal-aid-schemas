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
        expect(subject.total_income).to eq(14000.0)
        expect(subject.income_details.benefits.first.frequency).to eq('month')
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
