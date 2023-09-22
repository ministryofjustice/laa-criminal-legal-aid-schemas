RSpec.describe LaaCrimeSchemas::Structs::Document do
  subject { described_class.new(attributes) }

  let(:attributes) do
    LaaCrimeSchemas.fixture(1.0) { |json| json['supporting_evidence'][0] }
  end

  describe '.new' do
    context 'for a valid document object' do
      it 'builds a document struct' do
        expect(subject.s3_object_key).to eq('123/abcdef1234')
        expect(subject.filename).to eq('test.pdf')
        expect(subject.content_type).to eq('application/pdf')
        expect(subject.file_size).to eq(12)
      end
    end

    context 'for an invalid document object' do
      let(:attributes) { super().merge('filename' => nil) }

      it 'raises an error' do
        expect { subject }.to raise_error(Dry::Struct::Error, /filename/)
      end
    end
  end
end
