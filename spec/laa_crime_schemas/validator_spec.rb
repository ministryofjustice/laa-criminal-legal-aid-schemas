RSpec.describe LaaCrimeSchemas::Validator do
  subject { described_class.new(document, version: version) }

  let(:document) { { 'foo' => 'bar' } }
  let(:version) { nil }

  describe '#schema_version' do
    context 'when a specific version is provided' do
      let(:version) { 1.5 }

      it 'uses the version' do
        expect(subject.schema_version).to eq(1.5)
      end
    end

    context 'when a specific version is not provided' do
      context 'when the document declares a schema version' do
        let(:document) { { 'foo' => 'bar', 'schema_version' => 1.5 } }

        it 'uses the version' do
          expect(subject.schema_version).to eq(1.5)
        end
      end

      context 'when the document does not declare a schema version' do
        it 'raises an error' do
          expect { subject.schema_version }.to raise_error(LaaCrimeSchemas::Errors::SchemaVersionError)
        end
      end
    end

    context 'when the schema version is not recognised' do
      let(:document) { { 'foo' => 'bar', 'schema_version' => 1.5 } }

      it 'raises an error on `validate`' do
        expect { subject.valid? }.to raise_error(LaaCrimeSchemas::Errors::SchemaNotFoundError)
      end

      it 'raises an error on `fully_validate`' do
        expect { subject.fully_validate }.to raise_error(LaaCrimeSchemas::Errors::SchemaNotFoundError)
      end
    end
  end

  describe 'submitted application, schema version 1.0' do
    let(:valid_fixture) { 'application/1.0/application.json' }

    describe '#valid?' do
      context 'when the document is valid' do
        let(:document) { file_fixture(valid_fixture).read }

        it { expect(subject).to be_valid }
      end

      context 'when the document is not valid' do
        let(:document) { { schema_version: 1.0 }.to_json }

        it { expect(subject).not_to be_valid }
      end
    end

    describe '#fully_validate' do
      context 'when the document is valid' do
        let(:document) { file_fixture(valid_fixture).read }

        it { expect(subject.fully_validate).to be_empty }
      end

      context 'when the document is not valid' do
        let(:document) { { schema_version: 1.0 }.to_json }

        it { expect(subject.fully_validate).not_to be_empty }
      end
    end
  end

  describe 'returned application, schema version 1.0' do
    let(:valid_fixture) { 'application/1.0/application_returned.json' }

    describe '#valid?' do
      let(:document) { file_fixture(valid_fixture).read }

      it { expect(subject).to be_valid }
    end
  end

  describe 'pruned application, schema version 1.0' do
    subject { described_class.new(document, version: version, schema_name: 'pruned_application') }

    let(:valid_fixture) { 'application/1.0/pruned_application.json' }

    describe '#valid?' do
      context 'when the document is valid' do
        let(:document) { file_fixture(valid_fixture).read }

        it { expect(subject).to be_valid }
      end

      context 'when the document is not valid' do
        let(:document) { { schema_version: 1.0 }.to_json }

        it { expect(subject).not_to be_valid }
      end
    end

    describe '#fully_validate' do
      context 'when the document is valid' do
        let(:document) { file_fixture(valid_fixture).read }

        it { expect(subject.fully_validate).to be_empty }
      end

      context 'when the document is not valid' do
        let(:document) { { schema_version: 1.0 }.to_json }

        it { expect(subject.fully_validate).not_to be_empty }
      end

      context 'when there are additional unrecognised properties' do
        let(:document) do
          json = JSON.parse(file_fixture(valid_fixture).read)
          json.merge!('case_details' => {})
        end

        it { expect(subject.fully_validate.to_s).to match(/contains additional properties \[\\\"case_details\\\"\]/) }
      end
    end
  end

  describe 'maat application, schema version 1.0' do
    subject { described_class.new(document, version: version, schema_name: 'maat_application') }

    let(:valid_fixture) { 'application/1.0/maat_application.json' }

    describe '#valid?' do
      context 'when the document is valid' do
        let(:document) { file_fixture(valid_fixture).read }

        it { expect(subject).to be_valid }
      end

      context 'when the document is not valid' do
        let(:document) { { schema_version: 1.0 }.to_json }

        it { expect(subject).not_to be_valid }
      end
    end

    describe '#fully_validate' do
      context 'when the document is valid' do
        let(:document) { file_fixture(valid_fixture).read }

        it { expect(subject.fully_validate).to be_empty }
      end

      context 'when the document is not valid' do
        let(:document) { { schema_version: 1.0 }.to_json }

        it { expect(subject.fully_validate).not_to be_empty }
      end
    end
  end

  describe 'list of decisions' do
    subject { described_class.new(document, version: version, schema_name: 'general/decision', list: true) }

    let(:document) do
      [
        {
          'interests_of_justice' => {
            'result' => 'passed',
            'assessed_by' => 'Kory Liam',
            'assessed_on' => '2024-10-04'
          }
        },
        {
          'funding_decision' => 'refused',
          'interests_of_justice' => {
            'result' => 'failed',
            'assessed_by' => 'Kory Liam'
          }
        }
      ]
    end

    let(:version) { 1.0 }
    
    it 'validates every document' do
      expect(subject.fully_validate.count).to eq(2)
    end
  end
end
