RSpec.describe LaaCrimeSchemas::Validator do
  subject { described_class.new(document, version: version) }

  let(:document) { { 'foo' => 'bar' } }
  let(:version) { nil }

  def file_fixture(fixture_name)
    Pathname.new(File.join('spec/fixtures', fixture_name))
  end

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
        it 'assumes a minimum default version' do
          expect(subject.schema_version).to eq(0.1)
        end

        it 'is not valid because the version property is required in the schema' do
          expect(subject).not_to be_valid
        end
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
