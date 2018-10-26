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
  it {
    expect(book.year).to satisfy do |v|
      true if Integer(v)
    rescue StandardError
      false
    end
  }
  it {
    expect(book.year).to satisfy do |v|
      v.size == 4
    end
  }
end

describe Book do
  subject(:book) { build(:book) }

  describe '#save' do
    context 'With valid params' do
      it 'returns the new book object' do
        book.save!
        expect(book).to be_present
      end
    end

    let(:emptyBook) { Book.new }
    context 'With invalid params' do
      it 'returns exception' do
        expect { emptyBook.save! }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
