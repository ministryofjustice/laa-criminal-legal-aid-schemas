RSpec.describe LaaCrimeSchemas::Structs::CapitalDetails do
  subject(:struct) { described_class.new(attributes) }

  let(:valid_fixture) { 'application/1.0/means.json' }

  let(:attributes) do
    JSON.parse(file_fixture(valid_fixture).read).fetch('capital_details')
  end

  describe '.new' do
    context 'with valid capital details from fixture' do
      it 'builds the capital details struct' do
        expect(subject.has_premium_bonds).to eq('yes')
        expect(subject.premium_bonds_total_value).to eq(100_000)
        expect(subject.premium_bonds_holder_number).to eq('123568A')
        expect(subject.will_benefit_from_trust_fund).to eq('yes')
        expect(subject.trust_fund_amount_held).to eq(100_000)
        expect(subject.trust_fund_yearly_dividend).to eq(200_000)
        expect(subject.savings.size).to eq(1)
        expect(subject.investments.size).to eq(1)
        expect(subject.properties.size).to eq(1)
        expect(subject.national_savings_certificates.size).to eq(1)
      end
    end

    describe '#premium_bonds_total_value' do
      let(:key) { 'premium_bonds_total_value' }
      subject(:value) { struct.send(key) }

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

        it { is_expected.to be nil }
      end

      context 'when not a yes/no' do
        let(:attributes) { super().merge('has_premium_bonds' => 'NotYesOrNo') }

        it 'raises an error' do
          expect { subject }.to raise_error(Dry::Struct::Error, /#{key}/)
        end
      end
    end

    describe '#will_benefit_from_trust_fund' do
      let(:key) { 'will_benefit_from_trust_fund' }
      subject(:value) { struct.send(key) }

      # NOTE: Corresponding JSON Schema field does not allow `null`
      context 'when nil' do
        let(:attributes) { super().merge(key => nil) }

        it 'does not raise an error' do
          expect { subject }.not_to raise_error(Dry::Struct::Error, /#{key}/)
        end
      end

      context 'when not a yes/no' do
        let(:attributes) { super().merge('will_benefit_from_trust_fund' => 'NotYesOrNo') }

        it 'raises an error' do
          expect { subject }.to raise_error(Dry::Struct::Error, /#{key}/)
        end
      end
    end

    describe '#trust_fund_amount_held' do
      let(:key) { 'trust_fund_amount_held' }
      subject(:value) { struct.send(key) }

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

    describe '#trust_fund_yearly_dividend' do
      let(:key) { 'trust_fund_yearly_dividend' }
      subject(:value) { struct.send(key) }

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
  end
end
