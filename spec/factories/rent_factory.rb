require 'faker'

FactoryBot.define do
  factory :rent, class: Rent do
    start_date { Time.zone.now }
    end_date { Time.zone.now + 24.hours }
    user
    book
  end
end
