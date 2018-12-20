FactoryBot.define do
  factory :user, class: User do
    sequence(:name) { Faker::Name.unique.name }
    sequence(:email) { Faker::Internet.unique.safe_email }
    sequence(:password) { Faker::Dog.unique.name }
    sequence(:address) { Faker::Address.unique.street_address }
    sequence(:city) { Faker::Address.unique.city  }
    sequence(:state) { Faker::Address.state }
    sequence(:zipcode) { Faker::Address.unique.zip }
  end
end
