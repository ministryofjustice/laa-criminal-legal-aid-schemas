RSpec.describe LaaCrimeSchemas::Structs::CaseDetails do
  subject { described_class.new(attributes) }

  describe '.new' do
    let(:attributes) do
      LaaCrimeSchemas.fixture(1.0) { |json| json['case_details'] }
    end

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
        expect(subject.client_other_charge_in_progress).to eq('yes')
        expect(subject.partner_other_charge_in_progress).to eq('no')
        expect(subject.client_other_charge).to have_attributes({ charge: 'Theft', hearing_court_name: "Cardiff Magistrates' Court", next_hearing_date: Date.new(2025, 1, 15) })
        expect(subject.partner_other_charge).to be_nil
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

  # Consider using JSONSchema draft-07 when Ruby json-schema supports it
  # to make use of if/then/else type conditions. Current implementation
  # assumes a baseline level of data, allowing null values for the general
  # application.json schema. Alternatively introduce a separate schema for
  # Change in Financial Circumstances applications
  describe 'change in financial circumstances application' do
    let(:attributes) do
      JSON.parse(file_fixture('application/1.0/change_in_financial_circumstances.json').read)
    end

    it 'is valid' do
      expect(subject.offences.size).to eq(0)
      expect(subject.codefendants.size).to eq(0)
      expect(subject.client_other_charge_in_progress).to be_nil
      expect(subject.partner_other_charge_in_progress).to be_nil
      expect(subject.client_other_charge).to be_nil
      expect(subject.partner_other_charge).to be_nil
      expect(subject.hearing_court_name).to be_nil
      expect(subject.hearing_date).to be_nil
      expect(subject.is_first_court_hearing).to be_nil
      expect(subject.first_court_hearing_name).to be_nil
    end
  end
end
