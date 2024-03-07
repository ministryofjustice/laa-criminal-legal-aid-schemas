RSpec.describe LaaCrimeSchemas::Structs::Investment do
  subject { described_class.new(attributes) }

  let(:valid_fixture) { 'application/1.0/means.json' }

  let(:attributes) do
    JSON.parse(file_fixture(valid_fixture).read).fetch('capital_details').fetch('investments')[0]
  end

  describe '.new' do
    context 'for a valid investment object' do
      it 'builds a investment struct' do
        expect(subject.investment_type).to eq('unit_trust')
        expect(subject.description).to eq('Details of investment')
        expect(subject.value).to eq(200)
        expect(subject.holder).to eq('partner')
      end
    end

    context 'for an invalid investment object' do
      let(:attributes) { super().merge('investment_type' => 'invalid') }

      it 'raises an error' do
        expect { subject }.to raise_error(Dry::Struct::Error, /investment_type/)
      end
    end
  end
end
