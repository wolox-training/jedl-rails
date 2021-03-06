require 'rails_helper'

describe Book do
  subject(:book) { build(:book) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:genre) }
  it { is_expected.to validate_presence_of(:author) }
  it { is_expected.to validate_presence_of(:image) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:editor) }
  it { is_expected.to validate_presence_of(:year) }
  it { is_expected.to validate_numericality_of(:year).only_integer }
  it { is_expected.to validate_length_of(:year).is_equal_to(4) }
end
