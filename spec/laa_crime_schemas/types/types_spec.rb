RSpec.describe LaaCrimeSchemas::Types do
  describe 'Types' do
    context 'for offence class type' do
      it 'uses a valid offence class ranking' do
        expect(LaaCrimeSchemas::Types::OffenceClass.values).to eq( %w[A K G B I J D C H F E].freeze)
      end
    end
  end
end
