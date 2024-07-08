RSpec.describe LaaCrimeSchemas::Structs::IncomeDetails do
  describe 'schema version 1.0' do
    subject(:struct) { described_class.new(attributes) }

    let(:valid_fixture) { 'application/1.0/means.json' }

    let(:attributes) do
      JSON.parse(file_fixture(valid_fixture).read)['income_details']
    end

    describe '#employment_type' do
      subject(:employment_type) { struct.employment_type }

      context 'when not given' do
        let(:attributes) { {} }

        it { is_expected.to eq [] }
      end
      
      context 'when given as nil' do
        let(:attributes) { { employment_type: nil} }

        it 'raises Dry::Struct::Error' do
          expect { struct } .to raise_error Dry::Struct::Error
        end
      end

      context 'when given' do
        it { is_expected.to eq ['employed'] }
      end
    end

    describe '#partner_employment_type' do
      subject(:partner_employment_type) { struct.partner_employment_type }

      context 'when not given' do
        let(:attributes) { {} }

        it { is_expected.to eq [] }
      end
      
      context 'when given as nil' do
        let(:attributes) { { partner_employment_type: nil} }

        it 'raises Dry::Struct::Error' do
          expect { struct } .to raise_error Dry::Struct::Error
        end
      end

      context 'when given' do
        let(:attributes) { { partner_employment_type: ['self_employed', 'employed'] } }
        it { is_expected.to eq ['self_employed', 'employed'] }
      end
    end
  end
end
