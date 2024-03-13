RSpec.describe LaaCrimeSchemas::Structs::NationalSavingsCertificate do
  subject { described_class.new(attributes) }

  let(:valid_fixture) { 'application/1.0/means.json' }

  let(:attributes) do
    JSON.parse(file_fixture(valid_fixture).read).fetch('capital_details').fetch('national_savings_certificates')[0]
  end

  describe '.new' do
    context 'for a valid certificate' do
      it 'builds a national_savings_certificate struct' do
        expect(subject.holder_number).to eq('A123')
        expect(subject.certificate_number).to eq('B456')
        expect(subject.value).to eq(20010)
        expect(subject.ownership_type).to eq('partner')
      end
    end

    context 'for an invalid national_savings_certificate object' do
      let(:attributes) { super().merge('ownership_type' => 'collective') }

      it 'raises an error' do
        expect { subject }.to raise_error(Dry::Struct::Error, /ownership_type/)
      end
    end
  end
end
