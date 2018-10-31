require 'faker'

FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(8)

    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { password }
    password_confirmation { password }
  end
end
