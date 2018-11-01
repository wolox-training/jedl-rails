class Rent < ApplicationRecord
  validates_with StartEndDateValidator
  validates :start_date, :end_date, :user, :book, presence: true

  belongs_to :book
  belongs_to :user
end
