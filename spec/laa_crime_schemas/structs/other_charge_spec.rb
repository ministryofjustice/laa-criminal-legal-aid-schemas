RSpec.describe LaaCrimeSchemas::Structs::OtherCharge do
  subject { described_class.new(attributes) }

  describe '.new' do
    context 'for a valid other_charge object' do
      let(:attributes) do
        {
          'charge' => 'Theft',
          'hearing_court_name' => "Cardiff Magistrates' Court",
          'next_hearing_date' => '2025-01-15',
        }
      end

      it 'builds an other_charge struct' do
        expect(subject.charge).to eq('Theft')
        expect(subject.hearing_court_name).to eq("Cardiff Magistrates' Court")
        expect(subject.next_hearing_date).to eq(Date.new(2025, 1, 15))
      end
    end
  end
end
