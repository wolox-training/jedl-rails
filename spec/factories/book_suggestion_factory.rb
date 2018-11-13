require 'faker'

FactoryBot.define do
  factory :book_suggestion do
    link { Faker::Internet.url }
    synopsis { Faker::Movie.quote }
    price { Faker::Bank.account_number(5) }
    author { Faker::Book.author }
    title { Faker::Book.title }
    editor { Faker::Book.publisher }
    year { Faker::Date.between(2.days.ago, Time.zone.today).to_s[0, 4] }
    user
  end
end
