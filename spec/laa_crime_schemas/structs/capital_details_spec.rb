RSpec.describe LaaCrimeSchemas::Structs::CapitalDetails do
  subject(:struct) { described_class.new(attributes) }

  let(:valid_fixture) { 'application/1.0/means.json' }

  let(:attributes) do
    JSON.parse(file_fixture(valid_fixture).read).fetch('capital_details')
  end
  
  describe '.new' do
    context 'with valid capital details from fixture' do
      it 'builds the capital details struct' do
        expect(subject.has_premium_bonds).to eq('no')
        expect(subject.premium_bonds_total_value).to be_nil
        expect(subject.premium_bonds_holder_number).to be_nil
        expect(subject.savings.size).to eq(1)
        expect(subject.investments.size).to eq(1)
      end
    end

    describe '#premium_bonds_total_value' do
      let(:key) { 'premium_bonds_total_value' }
      subject(:value) { struct.send(key) }

      context 'when attribute is missing' do
        let(:attributes) { super().except(key) }

        it 'raises an error' do
          expect { subject }.to raise_error(Dry::Struct::Error, /#{key}/)
        end
      end

      context 'when an integer' do
        let(:attributes) { super().merge(key => 123100) }

        it { is_expected.to be 123100 }
      end
      
      context 'when nil' do
        let(:attributes) { super().merge(key => nil) }

        it { is_expected.to be nil }
      end
    
      context 'when not an integer' do
        let(:attributes) { super().merge(key => '1231.00') }

        it 'raises an error' do
          expect { subject }.to raise_error(Dry::Struct::Error, /#{key}/)
        end
      end
    end
    
    describe '#premium_bonds_holder_number' do
      let(:key) { 'premium_bonds_holder_number' }
      subject(:value) { struct.send(key) }

      context 'when nil' do
        let(:attributes) { super().merge(key => nil) }

        it { is_expected.to be nil }
      end
    
      context 'when a string' do
        let(:attributes) { super().merge(key => '001210') }

        it { is_expected.to eq '001210' }
      end

      context 'when attribute is missing' do
        let(:attributes) { super().except(key) }

        it 'raises an error' do
          expect { subject }.to raise_error(Dry::Struct::Error, /#{key}/)
        end
      end

      context 'when an integer' do
        let(:attributes) { super().merge(key => 123100) }

        it 'raises an error' do
          expect { subject }.to raise_error(Dry::Struct::Error, /#{key}/)
        end
      end
    end

    describe '#has_premium_bonds' do
      let(:key) { 'has_premium_bonds' }
      subject(:value) { struct.send(key) }

      context 'when nil' do
        let(:attributes) { super().merge(key => nil) }

        it 'raises an error' do
          expect { subject }.to raise_error(Dry::Struct::Error, /#{key}/)
        end
      end

      context 'when not a yes/no' do
        let(:attributes) { super().merge('has_premium_bonds' => 'NotYesOrNo') }

        it 'raises an error' do
          expect { subject }.to raise_error(Dry::Struct::Error, /#{key}/)
        end
      end
    
      context 'when attribute is missing' do
        let(:attributes) { super().except(key) }

        it 'raises an error' do
          expect { subject }.to raise_error(Dry::Struct::Error, /#{key}/)
        end
      end
    end
  end
end
