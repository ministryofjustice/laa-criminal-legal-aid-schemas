RSpec.describe LaaCrimeSchemas::Structs::ProviderDetails do
  subject { described_class.new(attributes) }

  let(:attributes) do
    LaaCrimeSchemas.fixture(1.0) { |json| json['provider_details'] }
  end

  describe '.new' do
    context 'for a valid provider details object' do
      it 'builds the provider details struct' do
        expect(subject.office_code).to eq('1A123B')
        expect(subject.provider_email).to eq('provider@example.com')
        expect(subject.legal_rep_first_name).to eq('John')
        expect(subject.legal_rep_last_name).to eq('Doe')
        expect(subject.legal_rep_telephone).to eq('123456789')
      end
    end
  end
end
