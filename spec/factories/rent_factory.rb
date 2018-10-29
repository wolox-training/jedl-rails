require 'faker'

FactoryBot.define do
    factory :rent, class: Rent do
        start_date { Time.now }
        end_date { Time.now + (60 * 60 * 24)}
        user
        book
    end
end