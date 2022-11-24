RSpec.describe LaaCrimeSchemas::Structs::CrimeApplication do
  subject { described_class.new(attributes) }

  describe 'schema version 1.0' do
    let(:valid_fixture) { 'application/1.0/application.json' }
    let(:invalid_fixture) { 'application/1.0/application_invalid.json' }

    context 'for a valid crime application object' do
      let(:attributes) do
        JSON.parse(file_fixture(valid_fixture).read)
      end

      # Just checking an attribute is enough as
      # if it was invalid it would raise an exception
      it 'builds a crime application struct' do
        expect(subject.reference).to eq(6000001)
      end

      it 'produces a valid JSON document conforming to the schema' do
        expect(
          LaaCrimeSchemas::Validator.new(subject.to_json)
        ).to be_valid
      end
    end

    context 'for an invalid crime application object' do
      let(:attributes) do
        JSON.parse(file_fixture(invalid_fixture).read)
      end

      it 'raises an error' do
        expect { subject }.to raise_error(Dry::Struct::Error, /case_details/)
      end
    end
  end
end
