RSpec.describe LaaCrimeSchemas::Structs::Address do
  subject { described_class.new(attributes) }

  describe '.new' do
    context 'for a valid address object' do
      let(:attributes) do
        {
          'lookup_id' => '12345',
          'address_line_one' => 'Line 1',
          'address_line_two' => '',
          'city' => 'City',
          'country' => 'Country',
          'postcode' => 'Postcode',
        }
      end

      it 'builds a the address struct' do
        expect(subject.lookup_id).to eq('12345')
        expect(subject.address_line_one).to eq('Line 1')
        expect(subject.address_line_two).to eq('')
        expect(subject.city).to eq('City')
        expect(subject.country).to eq('Country')
        expect(subject.postcode).to eq('Postcode')
      end
    end

    context 'for an invalid address object' do
      let(:attributes) { { 'foo' => 'bar' } }

      it 'raises an error' do
        expect { subject }.to raise_error(Dry::Struct::Error, /address_line_one/)
      end
    end
  end
end
