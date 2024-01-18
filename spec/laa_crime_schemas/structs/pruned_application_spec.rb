RSpec.describe LaaCrimeSchemas::Structs::PrunedApplication do
  subject { described_class.new(attributes) }

  describe 'schema version 1.0' do
    let(:fixture) { 'application/1.0/pruned_application.json' }
    let(:validator) { LaaCrimeSchemas::Validator.new(subject.to_json, schema_name: 'pruned_application') }

    context 'for a valid pruned crime application object' do
      let(:attributes) do
        JSON.parse(file_fixture(fixture).read)
      end

      # Just checking an attribute is enough as
      # if it was invalid it would raise an exception
      it 'builds a pruned crime application struct' do
        expect(subject.reference).to eq(6000118)
      end

      it 'produces a valid JSON document conforming to the schema' do
        expect(validator).to be_valid, validator.fully_validate
      end
    end

    context 'for an invalid pruned crime application object' do
      let(:attributes) do
        json = JSON.parse(file_fixture(fixture).read)
        json['client_details']['applicant'] = nil
        json
      end

      it 'raises an error' do
        expect { subject }.to raise_error(Dry::Struct::Error, /first_name/)
      end
    end
  end
end
