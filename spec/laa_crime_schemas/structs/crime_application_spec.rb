RSpec.describe LaaCrimeSchemas::Structs::CrimeApplication do
  subject { described_class.new(attributes) }

  describe 'schema version 1.0' do
    let(:valid_fixture) { 'application/1.0/application.json' }
    let(:returned_fixture) { 'application/1.0/application_returned.json' }
    let(:invalid_fixture) { 'application/1.0/application_invalid.json' }
    let(:multi_class_offence_fixture) { 'application/1.0/application_with_multi_class_offence.json' }

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

      it 'has an undetermined offence class' do
        expect(subject.case_details.offence_class).to eq(nil)
      end
    end

    context 'for an valid crime application object with multi class offences' do
      let(:attributes) do
        JSON.parse(file_fixture(multi_class_offence_fixture).read)
      end

      it 'has an undetermined offence class' do
        expect(subject.case_details.offence_class).to eq(nil)
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

      it 'returns the highest ranking offence class' do
        expect(subject.case_details.offence_class).to eq("A")
      end
    end

    context 'failsafe checks for required types' do
      it 'uses a valid offence class ranking' do
        expect(LaaCrimeSchemas::Traits::OffenceClass::OFFENCE_CLASS_RANKING).to eq(%w[a k g b i j d c h f e].freeze)
      end
    end
  end
end
