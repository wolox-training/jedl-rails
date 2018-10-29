require 'rails_helper'

describe Rent do
  subject(:rent) { build(:rent) }

  it { is_expected.to validate_presence_of(:start_date) }
  it { is_expected.to validate_presence_of(:end_date) }
end