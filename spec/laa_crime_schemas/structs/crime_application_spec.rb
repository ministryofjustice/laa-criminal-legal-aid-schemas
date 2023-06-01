RSpec.describe LaaCrimeSchemas::Structs::CrimeApplication do
  subject { described_class.new(attributes) }

  describe 'schema version 1.0' do
    let(:valid_fixture) { 'application/1.0/application.json' }
    let(:returned_fixture) { 'application/1.0/application_returned.json' }

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
        json = JSON.parse(file_fixture(valid_fixture).read)
        json['client_details']['applicant'] = nil
        json
      end

      it 'raises an error' do
        expect { subject }.to raise_error(Dry::Struct::Error, /first_name/)
      end
    end

    context 'for an invalid `correspondence_address_type` attribute' do
      let(:attributes) do
        json = JSON.parse(file_fixture(valid_fixture).read)
        json['client_details']['applicant']['correspondence_address_type'] = 'work_address'
        json
      end

      it 'raises an error' do
        expect { subject }.to raise_error(Dry::Struct::Error, /\"work_address\" \(String\) has invalid type/)
      end
    end

    context 'for a valid returned JSON document' do
      let(:attributes) do
        JSON.parse(file_fixture(returned_fixture).read)
      end

      it 'includes the return_details' do
        expect(subject.return_details).to be_a LaaCrimeSchemas::Structs::ReturnDetails
      end

      it 'produces a valid JSON document conforming to the schema' do
        expect(
          LaaCrimeSchemas::Validator.new(subject.to_json)
        ).to be_valid
      end
    end
  end
end
