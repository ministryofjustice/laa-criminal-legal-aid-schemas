RSpec.describe LaaCrimeSchemas::Structs::Decision do
  subject { described_class.new(attributes) }

  describe '.new' do
    context 'for a valid decision object' do
      let(:attributes) do
        {
          'reference' => 1234,
          'maat_id' => nil,
          'case_id' => '123123123',
          'assessment_rules' => 'committal_for_sentence',
          'interests_of_justice' => {
            'result' => 'passed',
            'details' => 'ioj details',
            'assessed_by' => 'Grace Nolan',
            'assessed_on' => '2024-10-01 00:00:00'
          },
          'means' => {
            'result' => 'failed',
            'details' => 'means details',
            'assessed_by' => 'Kory Liam',
            'assessed_on' => '2024-11-01 00:00:00'
          },
          'funding_decision' => 'granted',
          'comment' => 'test comment'
        }
      end

      it 'builds a decision struct' do
        expect(subject.reference).to eq(1234)
        expect(subject.maat_id).to be_nil
        expect(subject.case_id).to eq('123123123')
        expect(subject.assessment_rules).to eq('committal_for_sentence')
        expect(subject.interests_of_justice.result).to eq('passed')
        expect(subject.interests_of_justice.details).to eq('ioj details')
        expect(subject.interests_of_justice.assessed_by).to eq('Grace Nolan')
        expect(subject.interests_of_justice.assessed_on).to eq(Date.new(2024, 10, 1))
        expect(subject.means.result).to eq('failed')
        expect(subject.means.details).to eq('means details')
        expect(subject.means.assessed_by).to eq('Kory Liam')
        expect(subject.means.assessed_on).to eq(Date.new(2024, 11, 1))
        expect(subject.funding_decision).to eq('granted')
        expect(subject.comment).to eq('test comment')
      end
    end
  end
end
