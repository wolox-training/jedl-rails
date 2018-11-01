class Rent < ApplicationRecord
  validate :end_date_greather_than_start_date
  validates :start_date, :end_date, :user_id, :book_id, presence: true

  belongs_to :book
  belongs_to :user

  private

  def end_date_greather_than_start_date
    return if end_date.blank? || start_date.blank?

    errors.add(:end_date, 'must be after the start date') if end_date < start_date
  end
end
