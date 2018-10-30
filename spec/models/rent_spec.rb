require 'rails_helper'

describe Rent do
  subject(:rent) { build(:rent) }

  it { is_expected.to validate_presence_of(:start_date) }
  it { is_expected.to validate_presence_of(:end_date) }
  it { is_expected.to validate_presence_of(:book) }
  it { is_expected.to validate_presence_of(:user) }

  describe '#save' do
    context 'With valid params' do
      it 'returns the new rent object' do
        rent.save!
        expect(rent).to be_present
      end
    end

    context 'With invalid params' do
      let(:withoutBookValue) { build(:rent, book: nil) }
      it 'returns invalid book value' do
        expect(withoutBookValue).to be_invalid
      end

      let(:withoutUserValue) { build(:rent, user: nil) }
      it 'returns invalid user value' do
        expect(withoutUserValue).to be_invalid
      end

      let(:withoutStartDateValue) { build(:rent, start_date: "") }
      it 'returns invalid start date value' do
        expect(withoutStartDateValue).to be_invalid
      end

      let(:withoutEndDateValue) { build(:rent, end_date: "") }
      it 'returns invalid end date value' do
        expect(withoutEndDateValue).to be_invalid
      end
    end
  end
end
