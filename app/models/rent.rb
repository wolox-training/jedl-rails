class Rent < ApplicationRecord
  validate :end_date_greather_than_start_date
  validates :start_date, :end_date, :user_id, :book_id, presence: true

  belongs_to :book
  belongs_to :user
end
