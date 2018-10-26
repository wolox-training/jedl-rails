class Book < ApplicationRecord
  validates :genre, :author, :image, :title, :editor, presence: true
  validates :year, presence: true, length: { minimum: 4, maximum: 4 },
                   numericality: { only_integer: true }
end
