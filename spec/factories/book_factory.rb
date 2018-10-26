require 'faker'

FactoryBot.define do
    factory :book, class: Book do
        genre { Faker::Book.genre }
        author { Faker::Book.author }
        image { Faker::Simpsons.quote }
        title { Faker::Book.title }
        editor { Faker::Book.publisher }
        year { (Faker::Date.between(2.days.ago, Date.today).to_s)[0,4] }
    end
end