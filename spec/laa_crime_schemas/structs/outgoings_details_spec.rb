RSpec.describe LaaCrimeSchemas::Structs::OutgoingsDetails do
  subject(:struct) { described_class.new(attributes) }

  let(:valid_fixture) { 'application/1.0/means.json' }

  let(:attributes) do
    JSON.parse(file_fixture(valid_fixture).read).fetch('outgoings_details')
  end

  describe '.new' do
    context 'with valid outgoings details from fixture' do
      it 'builds the capital details struct' do
        expect(subject.outgoings.size).to eq(3)
        expect(subject.housing_payment_type).to eq('rent')
        expect(subject.income_tax_rate_above_threshold).to eq('no')
        expect(subject.partner_income_tax_rate_above_threshold).to eq(nil)
        expect(subject.outgoings_more_than_income).to eq('yes')
        expect(subject.how_manage).to eq("A description of how they manage")
        expect(subject.pays_council_tax).to eq('no')
        expect(subject.has_no_other_outgoings).to eq('no')
      end
    end

    describe '#outgoings' do
      let(:key) { 'outgoings' }
      subject(:value) { struct.send(key) }

      context 'when an array of outgoings' do
        it 'returns the outgoings' do
          expect(value.map(&:payment_type)).to eq(
            %w[childcare legal_aid_contribution board_and_lodging]
          )
        end
      end

      context 'when nil' do
        let(:attributes) { {} }

        it { is_expected.to eq [] }
      end

      context 'when not an outgoings' do
        let(:attributes) { super().merge(key => [{'house' => 'castle'}]) }

        it 'raises an error' do
          expect { subject }.to raise_error(Dry::Struct::Error)
        end
      end
    end
  end
end
