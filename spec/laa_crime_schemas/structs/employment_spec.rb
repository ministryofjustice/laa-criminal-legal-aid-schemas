RSpec.describe LaaCrimeSchemas::Structs::Employment do
  subject { described_class.new(attributes) }

  let(:valid_fixture) { 'application/1.0/means.json' }

  let(:employment_attributes) do
    JSON.parse(file_fixture(valid_fixture).read).fetch('income_details').fetch('employments')
  end

  let(:attributes) do
    employment_attributes[0]
  end

  describe '.new' do
    context 'for a valid employment object' do
      context 'with deduction' do
        let(:attributes) do
          employment_attributes[0]
        end

        it 'builds an employment struct' do
          expect(subject.employer_name).to eq("Joe Goodwin")
          expect(subject.job_title).to eq("Supervisor")
          expect(subject.has_no_deductions).to be_nil
          expect(subject.amount).to eq(25000)
          expect(subject.frequency).to eq("annual")
          expect(subject.ownership_type).to eq("applicant")
          expect(subject.metadata.before_or_after_tax).to match({"value"=>"before_tax"})
          expect(subject.address.address_line_one).to eq('address_line_one_y')
          expect(subject.address.address_line_two).to eq('address_line_two_y')
          expect(subject.address.city).to eq('city_y')
          expect(subject.address.country).to eq('country_y')
          expect(subject.address.postcode).to eq('postcode_y')
          expect(subject.deductions.count).to eq(3)
          expect(subject.deductions[0]).to have_attributes({ deduction_type: "income_tax", details:nil, amount: 1000, frequency: "week" })
          expect(subject.deductions[1]).to have_attributes({ deduction_type: "national_insurance", details: nil, amount: 2000, frequency: "fortnight" })
          expect(subject.deductions[2]).to have_attributes({ deduction_type: "other", details: "deduction details", amount: 3000, frequency: "annual" })
        end
      end

      context 'without deduction' do
        let(:attributes) do
          employment_attributes[1]
        end

        it 'builds an employment struct' do
          expect(subject.employer_name).to eq("Teegan Ayala")
          expect(subject.job_title).to eq("Manager")
          expect(subject.has_no_deductions).to eq("yes")
          expect(subject.amount).to eq(35000)
          expect(subject.frequency).to eq("annual")
          expect(subject.ownership_type).to eq("applicant")
          expect(subject.metadata.before_or_after_tax).to match({"value"=>"after_tax"})
          expect(subject.address.address_line_one).to eq('address_line_one_x')
          expect(subject.address.address_line_two).to eq('address_line_two_x')
          expect(subject.address.city).to eq('city_x')
          expect(subject.address.country).to eq('country_x')
          expect(subject.address.postcode).to eq('postcode_x')
          expect(subject.deductions.count).to eq(0)
        end
      end
    end

    context 'for an invalid employment object' do
      context "when ownership_type is invalid" do
        let(:attributes) { super().merge('ownership_type' => 'invalid') }

        it 'raises an error' do
          expect { subject }.to raise_error(Dry::Struct::Error, /ownership_type/)
        end
      end

      context "when frequency is invalid" do
        let(:attributes) { super().merge('frequency' => 'invalid') }

        it 'raises an error' do
          expect { subject }.to raise_error(Dry::Struct::Error, /frequency/)
        end
      end
    end
  end
end
