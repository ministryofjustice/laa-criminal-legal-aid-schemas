RSpec.describe LaaCrimeSchemas::Types do
  describe 'Types' do
    context 'for offence class type' do
      it 'uses a valid offence class ranking' do
        expect(LaaCrimeSchemas::Types::OffenceClass.values).to eq( %w[A K G B I J D C H F E].freeze)
      end
    end

    context 'for ownership type' do
      it 'sets applicant as the default' do
        expect(LaaCrimeSchemas::Types::OwnershipType[]).to eq('applicant')
      end
    end
  end
end
