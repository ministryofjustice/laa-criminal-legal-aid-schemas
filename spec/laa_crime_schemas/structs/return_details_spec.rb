RSpec.describe LaaCrimeSchemas::Structs::ReturnDetails do
  subject { described_class.new(attributes) }

  let(:valid_details) do
    JSON.parse(
      LaaCrimeSchemas.fixture(1.0, name: 'application_returned').read
    )['return_details']
  end

  describe '.new' do
    context 'with valid reason' do
      let(:attributes) { valid_details }

      it 'builds the return details struct' do
        expect(subject.reason).to eq('clarification_required')
        expect(subject.details).to eq('Further information regarding IoJ required')
        expect(subject.returned_at.to_s).to eq('2022-09-27T14:10:00+00:00')
      end
    end

    context 'with invalid reason' do
      let(:attributes) do
        valid_details.merge(reason: "not_a_reason")
      end

      it 'raises an error' do
        expect { subject }.to raise_error(Dry::Struct::Error, /invalid type for :reason/)
      end
    end

    context 'with missing details' do
      let(:attributes) do
        valid_details.merge(details: nil)
      end

      it 'raises an error' do
        expect { subject }.to raise_error(Dry::Struct::Error, /invalid type for :details/)
      end
    end

    context 'with missing returned_at' do
      let(:attributes) do
        valid_details.merge(returned_at: nil)
      end

      it 'raises an error' do
        expect { subject }.to raise_error(Dry::Struct::Error, /invalid type for :returned_at/)
      end
    end

    context 'with split case reason' do
      let(:valid_details) do
        JSON.parse(
          LaaCrimeSchemas.fixture(1.0, name: 'application_returned_split_case').read
        )['return_details']
      end

      let(:attributes) { valid_details }

      it 'builds the return details struct' do
        expect(subject.reason).to eq('split_case')
        expect(subject.details).to eq('Offence 1 reason requires more detail')
        expect(subject.returned_at.to_s).to eq('2022-09-27T14:10:00+00:00')
      end
    end
  end
end
