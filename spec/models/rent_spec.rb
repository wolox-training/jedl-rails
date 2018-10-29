require 'rails_helper'

describe Rent do
  subject(:rent) { build(:rent) }

  it { is_expected.to validate_presence_of(:start_date) }
  it { is_expected.to validate_presence_of(:end_date) }

  describe '#save' do
    context 'With valid params' do
      it 'returns the new rent object' do
        rent.save!
        expect(rent).to be_present
      end
    end

    let(:emptyRent) { Rent.new }
    context 'With invalid params' do
      it 'returns exception' do
        expect { emptyRent.save! }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end