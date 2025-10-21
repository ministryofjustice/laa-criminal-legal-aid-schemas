RSpec.describe LaaCrimeSchemas::Structs::AnonymisedCrimeApplication do
  subject { described_class.new(attributes) }

  describe 'schema version 1.0' do
    let(:application) { 'application/1.0/application.json' }
    let(:fixture) { 'application/1.0/anonymised_application.json' }

    let(:validator) do
      LaaCrimeSchemas::Validator.new(subject.to_json, schema_name: 'anonymised_application')
    end

    context 'when initialised with the crime application fixture' do
      let(:attributes) do
        JSON.parse(file_fixture(application).read)
      end

      it 'returns an anonymised application matching the fixture' do
        expect(JSON.parse(subject.to_json)).to eq(JSON.parse(file_fixture(fixture).read))
      end

      it 'produces a valid JSON document conforming to the anonymised application schema' do
        expect(validator).to be_valid, validator.fully_validate
      end
    end
  end
end
