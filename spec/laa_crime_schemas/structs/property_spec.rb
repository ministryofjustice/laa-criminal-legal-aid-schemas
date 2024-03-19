RSpec.describe LaaCrimeSchemas::Structs::Property do
  subject { described_class.new(attributes) }

  let(:valid_fixture) { 'application/1.0/means.json' }

  let(:attributes) do
    JSON.parse(file_fixture(valid_fixture).read).fetch('capital_details').fetch('properties')[0]
  end

  describe '.new' do
    context 'for a valid property object' do
      it 'builds a property struct' do
        expect(subject.property_type).to eq('residential')
        expect(subject.house_type).to eq('custom')
        expect(subject.custom_house_type).to eq('custom house type')
        expect(subject.size_in_acres).to eq(100)
        expect(subject.usage).to eq("usage details")
        expect(subject.bedrooms).to eq(2)
        expect(subject.value).to eq(20_000_000)
        expect(subject.outstanding_mortgage).to eq(10_000_000)
        expect(subject.percentage_applicant_owned).to eq(80)
        expect(subject.percentage_partner_owned).to eq(20)
        expect(subject.is_home_address).to eq('yes')
        expect(subject.has_other_owners).to eq('no')
        expect(subject.address.address_line_one).to eq('address_line_one_x')
        expect(subject.address.address_line_two).to eq('address_line_two_x')
        expect(subject.address.city).to eq('city_x')
        expect(subject.address.country).to eq('country_x')
        expect(subject.address.postcode).to eq('postcode_x')
        expect(subject.property_owners.count).to eq(2)
        expect(subject.property_owners[0].name).to eq("Jack")
        expect(subject.property_owners[0].relationship).to eq("ex_partner")
        expect(subject.property_owners[0].custom_relationship).to be_nil
        expect(subject.property_owners[0].percentage_owned).to eq(20.0)
        expect(subject.property_owners[1].name).to eq("Joe")
        expect(subject.property_owners[1].relationship).to eq("custom")
        expect(subject.property_owners[1].custom_relationship).to eq("custom relationship")
        expect(subject.property_owners[1].percentage_owned).to eq(80.0)
      end
    end

    context 'for an invalid property object' do
      let(:attributes) { super().merge('property_type' => 'invalid') }

      it 'raises an error' do
        expect { subject }.to raise_error(Dry::Struct::Error, /property_type/)
      end
    end
  end
end
