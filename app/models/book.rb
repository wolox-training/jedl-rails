class Book < ApplicationRecord
  validates :genre, :author, :image, :title, :editor, presence: true
<<<<<<< HEAD
  validates :year, presence: true, length: { is: 4 },
=======
  validates :year, presence: true, length: { minimum: 4, maximum: 4 },
>>>>>>> UPDATE
                   numericality: { only_integer: true }

  has_many :rents, dependent: :destroy
  has_many :users, through: :rents
end
