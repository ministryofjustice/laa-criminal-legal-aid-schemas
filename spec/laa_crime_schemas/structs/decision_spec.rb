
RSpec.describe LaaCrimeSchemas::Structs::Decision do
  subject { described_class.new(attributes) }

  describe '.new' do
    context 'for a valid decision object' do
      let(:attributes) do
        {
          'reference' => 1234,
          'maat_id' => nil,
          'interests_of_justice' => {
            'result' => 'pass',
            'details' => 'decision details',
            'assessed_by' => 'Grace Nolan',
            'assessed_on' => '2024-10-01 00:00:00'
          },
          'means' => nil,
          'funding_decision' => 'granted',
          'comment' => 'test comment'
        }
      end

      it 'builds a decision struct' do
        expect(subject.reference).to eq(1234)
        expect(subject.maat_id).to be_nil
        expect(subject.interests_of_justice.result).to eq('pass')
        expect(subject.interests_of_justice.details).to eq('decision details')
        expect(subject.interests_of_justice.assessed_by).to eq('Grace Nolan')
        expect(subject.interests_of_justice.assessed_on).to eq(Date.new(2024, 10, 1))
        expect(subject.means).to be_nil
        expect(subject.funding_decision).to eq('granted')
        expect(subject.comment).to eq('test comment')
      end
    end
  end
end
