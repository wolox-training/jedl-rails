class Book < ApplicationRecord
  validates :genre, :author, :image, :title, :editor, presence: true
  validates :year, presence: true, length: { is: 4 },
                   numericality: { only_integer: true }
end
