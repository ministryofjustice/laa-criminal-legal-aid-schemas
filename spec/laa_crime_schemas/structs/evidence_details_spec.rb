RSpec.describe LaaCrimeSchemas::Structs::EvidenceDetails do
  subject { described_class.new(attributes) }

  let(:attributes) do
    LaaCrimeSchemas.fixture(1.0) { |json| json['evidence_details'] }
  end

  describe '.new' do
    context 'for a valid evidence details object' do
      it 'builds the evidence details struct' do
        expect(subject.last_run_at.strftime('%F %T')).to eq(
          DateTime.new(2024, 4, 24, 13, 28, 30).strftime('%F %T')
        )

        expect(subject.evidence_prompts.size).to eq 1
        expect(subject.evidence_prompts.first.id).to eq 'NationalInsuranceProof'
        expect(subject.evidence_prompts.first.group).to eq 'none'
        expect(subject.evidence_prompts.first.ruleset).to eq 'Latest'
        expect(subject.evidence_prompts.first.key).to eq 'national_insurance_32'
        expect(subject.evidence_prompts.first.run.other.result).to eq true
        expect(subject.evidence_prompts.first.run.other.prompt.first).to eq 'their National Insurance number'
      end
    end
  end
end
