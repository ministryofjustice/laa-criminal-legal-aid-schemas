RSpec.describe LaaCrimeSchemas::Structs::ReturnDetails do
  subject { described_class.new(attributes) }

  let(:valid_details) do
    LaaCrimeSchemas.fixture(1.0, name: 'application_returned') { |json| json['return_details'] }
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
  end
end
