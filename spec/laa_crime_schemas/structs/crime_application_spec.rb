RSpec.describe LaaCrimeSchemas::Structs::CrimeApplication do
  subject { described_class.new(attributes) }

  let(:valid_fixture) { 'applications/application_v0.1.json' }
  let(:invalid_fixture) { 'applications/application_v0.1_invalid.json' }

  describe '.new' do
    context 'for a valid crime application object' do
      let(:attributes) do
        JSON.parse(file_fixture(valid_fixture).read)
      end

      # Just checking an attribute is enough as
      # if it was invalid it would raise an exception
      it 'builds a crime application struct' do
        expect(subject.reference).to eq(6000001)
      end
    end

    context 'for an invalid crime application object' do
      let(:attributes) do
        JSON.parse(file_fixture(invalid_fixture).read)
      end

      it 'raises an error' do
        expect { subject }.to raise_error(Dry::Struct::Error, /nino/)
      end
    end
  end
end
