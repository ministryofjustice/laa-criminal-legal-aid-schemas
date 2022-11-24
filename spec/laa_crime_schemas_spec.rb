# frozen_string_literal: true

RSpec.describe LaaCrimeSchemas do
  it 'has a version number' do
    expect(described_class::VERSION).not_to be nil
  end

  describe '.fixture' do
    it 'returns the path to a specific fixture' do
      expected = File.join('spec', 'fixtures', 'application', '1.0', 'application.json')
      pathname = described_class.fixture(1.0)

      expect(pathname.to_s).to end_with(expected)
      expect(pathname.exist?).to be(true)
    end
  end
end
