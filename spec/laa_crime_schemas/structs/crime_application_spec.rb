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

    describe 'change in financial circumstances application' do
      let(:valid_fixture) { 'application/1.0/change_in_financial_circumstances.json' }

      context 'for a valid crime application object' do
        let(:attributes) do
          JSON.parse(file_fixture(valid_fixture).read)
        end

        it 'has correct application_type and pre_cifc fields' do
          expect(subject.application_type).to eq 'change_in_financial_circumstances'
          expect(subject.pre_cifc_reference_number).to eq 'pre_cifc_maat_id'
          expect(subject.pre_cifc_maat_id).to eq '987654321'
          expect(subject.pre_cifc_reason).to eq 'My client has a new job'
        end

        it 'does not have any interests_of_justice' do
          expect(subject.interests_of_justice.size).to eq 0
        end

        it 'has date_stamp_context' do
          expect(subject.date_stamp_context.first_name).to eq 'Reckit'
          expect(subject.date_stamp_context.last_name).to eq 'Ralph'
          expect(subject.date_stamp_context.date_of_birth).to eq Date.new(2005, 6, 9)
          expect(subject.date_stamp_context.date_stamp.to_date).to eq Date.new(2022, 10, 24)
        end
      end
    end
  end
end
