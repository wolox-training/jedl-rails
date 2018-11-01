require 'faker'

FactoryBot.define do
  factory :book do
    genre { Faker::Book.genre }
    author { Faker::Book.author }
    image { Faker::Simpsons.quote }
    title { Faker::Book.title }
    editor { Faker::Book.publisher }
    year { Faker::Date.between(2.days.ago, Time.zone.today).to_s[0, 4] }
  end
end
