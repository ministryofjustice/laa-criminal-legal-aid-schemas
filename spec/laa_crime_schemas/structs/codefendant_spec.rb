RSpec.describe LaaCrimeSchemas::Structs::Codefendant do
  subject { described_class.new(attributes) }

  describe '.new' do
    context 'for a valid codefendant object' do
      let(:attributes) do
        {
          'first_name' => 'John',
          'last_name' => 'Doe',
          'conflict_of_interest' => 'yes',
        }
      end

      it 'builds a codefendant struct' do
        expect(subject.first_name).to eq('John')
        expect(subject.last_name).to eq('Doe')
        expect(subject.conflict_of_interest).to eq('yes')
      end

      it 'has a full name' do
        expect(subject.full_name).to eq('John Doe')
      end
    end
  end
end
