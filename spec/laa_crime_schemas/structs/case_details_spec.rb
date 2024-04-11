RSpec.describe LaaCrimeSchemas::Structs::CaseDetails do
  subject { described_class.new(attributes) }

  let(:attributes) do
    LaaCrimeSchemas.fixture(1.0) { |json| json['case_details'] }
  end

  describe '.new' do
    context 'for a valid case details object' do
      # Just a sanity check to ensure the struct "understands" the JSON object
      # Offence and Codefendant structs are tested separately
      it 'builds the case details struct' do
        expect(subject.urn).to eq('')
        expect(subject.case_type).to eq('appeal_to_crown_court')
        expect(subject.appeal_lodged_date).to be_a(Date)
        expect(subject.appeal_original_app_submitted).to be_nil
        expect(subject.appeal_financial_circumstances_changed).to be_nil
        expect(subject.appeal_with_changes_details).to be_nil
        expect(subject.appeal_reference_number).to be_nil
        expect(subject.appeal_maat_id).to be_nil
        expect(subject.appeal_usn).to be_nil
        expect(subject.offences.size).to eq(2)
        expect(subject.codefendants.size).to eq(1)
        expect(subject.hearing_court_name).to eq("Cardiff Magistrates' Court")
        expect(subject.hearing_date).to be_a(Date)
        expect(subject.is_first_court_hearing).to eq('no')
        expect(subject.first_court_hearing_name).to eq('Bristol Magistrates Court')
      end
    end

    context 'for an invalid case details object' do
      let(:attributes) { super().merge('offences' => nil) }

      it 'raises an error' do
        expect { subject }.to raise_error(Dry::Struct::Error, /offences/)
      end
    end
  end
end
