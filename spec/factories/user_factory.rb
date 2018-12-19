FactoryBot.define do
  factory :user, class: User do
    sequence(:name) { Faker::Name.name }
    sequence(:email) { Faker::Internet.safe_email }
    sequence(:password) { Faker::Dog.name }
    sequence(:address) { Faker::Address.street_address }
    sequence(:city) { Faker::Address.city  }
    sequence(:state) { Faker::Address.state }
    sequence(:zipcode) { Faker::Address.zip }
  end
end
