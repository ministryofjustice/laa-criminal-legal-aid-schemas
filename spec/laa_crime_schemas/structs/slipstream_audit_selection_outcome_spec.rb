RSpec.describe LaaCrimeSchemas::Structs::SlipstreamAuditSelectionOutcome do
  subject(:outcome) { described_class.new(attributes) }

  let(:attributes) do
    LaaCrimeSchemas.fixture(1.0) { |json| json.fetch('slipstream_audit_selection_outcome') }
  end

  it 'builds a slipstream audit selection outcome struct' do
    expect(outcome).to have_attributes(
      status: 'confirmed',
      sample_rate: 10,
      sampled_at: DateTime.parse('2026-09-03T10:00:00.000Z'),
      status_determined_at: DateTime.parse('2026-09-04T11:00:00.000Z')
    )
  end

  it 'accepts every selection outcome status' do
    statuses = %w[not_selected selected confirmed withdrawn]

    expect(statuses.map { |status| described_class.new(attributes.merge('status' => status)).status }).to eq(statuses)
  end

  it 'rejects an unsupported status' do
    expect {
      described_class.new(attributes.merge('status' => 'rejected'))
    }.to raise_error(Dry::Struct::Error)
  end

  it 'rejects a sample rate outside the valid percentage range' do
    expect {
      described_class.new(attributes.merge('sample_rate' => 101))
    }.to raise_error(Dry::Struct::Error)
  end
end
