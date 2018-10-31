require 'faker'

FactoryBot.define do
  factory :rent do
    start_date { Time.zone.now }
    end_date { Time.zone.now + (60 * 60 * 24) }
    user
    book
  end
end
