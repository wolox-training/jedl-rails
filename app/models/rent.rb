class Rent < ApplicationRecord
  validates_with StartEndDateValidator
  validates :start_date, :end_date, :book, :user, presence: true

  belongs_to :book
  belongs_to :user
end
