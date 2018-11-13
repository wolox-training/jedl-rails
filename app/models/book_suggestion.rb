class BookSuggestion < ApplicationRecord
  validates :author, :title, :link, :editor, presence: true
  validates :year, presence: true, length: { is: 4 },
                   numericality: { only_integer: true }
  validates :link, url: true

  belongs_to :user
end
