class Rent < ApplicationRecord
  include ActiveModel::Validations

  validates_with StartEndDateValidator
  validates :start_date, :end_date, :book, :user, presence: true

  belongs_to :book
  belongs_to :user
end
