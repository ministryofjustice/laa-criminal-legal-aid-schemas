RSpec.describe LaaCrimeSchemas::Structs::Saving do
  subject { described_class.new(attributes) }

  let(:valid_fixture) { 'application/1.0/means.json' }

  let(:attributes) do
    JSON.parse(file_fixture(valid_fixture).read).fetch('capital_details').fetch('savings')[0]
  end

  describe '.new' do
    context 'for a valid saving object' do
      it 'builds a saving struct' do
        expect(subject.saving_type).to eq('bank')
        expect(subject.provider_name).to eq('Halifax')
        expect(subject.sort_code).to eq('123456')
        expect(subject.account_number).to eq('12345678')
        expect(subject.account_balance).to eq(200)
        expect(subject.is_overdrawn).to eq('yes')
        expect(subject.are_wages_paid_into_account).to eq('yes')
        expect(subject.are_partners_wages_paid_into_account).to be_nil
        expect(subject.ownership_type).to eq('applicant')
      end
    end

    context 'for an invalid saving object' do
      let(:attributes) { super().merge('saving_type' => 'invalid') }

      it 'raises an error' do
        expect { subject }.to raise_error(Dry::Struct::Error, /saving_type/)
      end
    end
  end
end
