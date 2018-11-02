require 'rails_helper'

describe Rent do
  subject(:rent) { build(:rent) }

  it { is_expected.to validate_presence_of(:start_date) }
  it { is_expected.to validate_presence_of(:end_date) }
  it { is_expected.to validate_presence_of(:book) }
  it { is_expected.to validate_presence_of(:user) }
end

describe Rent do
  describe '#save' do
    context 'With invalid params' do
      let(:wihtout_book_value) { build(:rent, book: nil) }

      it 'returns invalid book value' do
        expect(wihtout_book_value).to be_invalid
      end

      let(:without_user_value) { build(:rent, user: nil) }

      it 'returns invalid user value' do
        expect(without_user_value).to be_invalid
      end

      let(:without_start_date) { build(:rent, start_date: '') }

      it 'returns invalid start date value' do
        expect(without_start_date).to be_invalid
      end

      let(:without_end_date) { build(:rent, end_date: '') }

      it 'returns invalid end date value' do
        expect(without_end_date).to be_invalid
      end
    end
  end
end
