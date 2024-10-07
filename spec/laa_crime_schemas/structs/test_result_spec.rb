
RSpec.describe LaaCrimeSchemas::Structs::TestResult do
  subject { described_class.new(attributes) }

  describe '.new' do
    context 'for a valid test_result object' do
      let(:attributes) do
        {
          'result' => 'pass',
          'details' => 'decision details',
          'assessed_by' => 'Grace Nolan',
          'assessed_on' => '2024-10-01 00:00:00'
        }
      end

      it 'builds a test_result struct' do
        expect(subject.result).to eq('pass')
        expect(subject.details).to eq('decision details')
        expect(subject.assessed_by).to eq('Grace Nolan')
        expect(subject.assessed_on).to eq(Date.new(2024, 10, 1))
      end
    end
  end
end
