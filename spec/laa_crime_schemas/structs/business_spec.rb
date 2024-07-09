RSpec.describe LaaCrimeSchemas::Structs::Business do
  subject { described_class.new(attributes) }

  describe '.new' do
    context 'for a valid business object' do
      let(:attributes) do
        {
          'ownership_type' => 'applicant',
          'business_type' => 'self_employed',
          'trading_name' => 'Test trading name',
          'description' => 'Test description',
          'trading_start_date' => "2010-06-09",
          'address' => {
            'lookup_id' => nil,
            'address_line_one' => "1 Road",
            'address_line_two' => "Village",
            'city' => "Some nice city",
            'country' => "United Kingdom",
            'postcode' => "SW1A 2AA"
          },
          'has_additional_owners' => 'yes',
          'additional_owners' => 'Test Owner',
          'has_employees' => 'yes',
          'number_of_employees' => 5,
          'salary' => {
            'amount' => 50000,
            'frequency' => "annual",
          },
          'total_income_share_sales' => {
            'amount' => 50000,
            'frequency' => "annual",
          },
          'percentage_profit_share' => 45.6,
          'turnover' => {
            'amount' => 20000,
            'frequency' => "month",
          },
          'drawings' => {
            'amount' => 20000,
            'frequency' => "annual",
          },
          'profit' => {
            'amount' => 10000,
            'frequency' => "month",
          },
        }
      end

      it 'builds a business struct' do
        expect(subject.ownership_type).to eq("applicant")
        expect(subject.business_type).to eq("self_employed")
        expect(subject.trading_name).to eq("Test trading name")
        expect(subject.description).to eq("Test description")
        expect(subject.address.address_line_one).to eq('1 Road')
        expect(subject.address.address_line_two).to eq('Village')
        expect(subject.address.city).to eq('Some nice city')
        expect(subject.address.country).to eq('United Kingdom')
        expect(subject.address.postcode).to eq('SW1A 2AA')
        expect(subject.has_additional_owners).to eq('yes')
        expect(subject.additional_owners).to eq('Test Owner')
        expect(subject.has_employees).to eq('yes')
        expect(subject.number_of_employees).to eq(5)
        expect(subject.salary).to have_attributes({ amount: 50000, frequency: "annual" })
        expect(subject.total_income_share_sales).to have_attributes({ amount: 50000, frequency: "annual" })
        expect(subject.percentage_profit_share).to eq(45.6)
        expect(subject.turnover).to have_attributes({ amount: 20000, frequency: "month" })
        expect(subject.drawings).to have_attributes({ amount: 20000, frequency: "annual" })
        expect(subject.profit).to have_attributes({ amount: 10000, frequency: "month" })
      end
    end

    context 'for an invalid business object' do
      context "when ownership_type is invalid" do
        let(:attributes) { { 'ownership_type' => 'invalid' } }

        it 'raises an error' do
          expect { subject }.to raise_error(Dry::Struct::Error, /ownership_type/)
        end
      end
    end
  end
end
