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

  describe 'schema version 0.1' do
    let(:valid_fixture) { 'applications/application_v0.1.json' }
    let(:invalid_fixture) { 'applications/application_v0.1_invalid.json' }

    describe '#valid?' do
      context 'when the document is valid' do
        let(:document) { file_fixture(valid_fixture).read }

        it { expect(subject).to be_valid }
      end

      context 'when the document is not valid' do
        let(:document) { file_fixture(invalid_fixture).read }

        it { expect(subject).not_to be_valid }
      end
    end

    describe '#fully_validate' do
      context 'when the document is valid' do
        let(:document) { file_fixture(valid_fixture).read }

        it { expect(subject.fully_validate).to be_empty }
      end

      context 'when the document is not valid' do
        let(:document) { file_fixture(invalid_fixture).read }

        it { expect(subject.fully_validate).not_to be_empty }
      end
    end
  end
end
