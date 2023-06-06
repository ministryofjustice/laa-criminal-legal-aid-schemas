RSpec.describe LaaCrimeSchemas::Structs::Offence do
  subject { described_class.new(attributes) }

  let(:attributes) do
    LaaCrimeSchemas.fixture(1.0) { |json| json['case_details']['offences'][0] }
  end

  describe '.new' do
    context 'for a valid offence object' do
      it 'builds a codefendant struct' do
        expect(subject.name).to eq('Attempt robbery')
        expect(subject.offence_class).to eq('C')
        expect(subject.passportable).to eq(true)

        expect(subject.dates.size).to eq(2)
        expect(subject.dates[0].date_from).to be_a(Date)
        expect(subject.dates[0].date_to).to be_a(Date)
        expect(subject.dates[1].date_from).to be_a(Date)
        expect(subject.dates[1].date_to).to be_nil
      end
    end

    context 'for an invalid offence object' do
      let(:attributes) { super().merge('offence_class' => 'X') }

      it 'raises an error' do
        expect { subject }.to raise_error(Dry::Struct::Error, /offence_class/)
      end
    end
  end
end
