FactoryBot.define do
  factory :user, class: User do
    sequence(:email) { |n| "user_#{n}@gmail.com" }
    sequence(:password) { |n| "Password #{n}" }
    sequence(:username) { |n| "Username #{n}" }
    sequence(:address) { |n| "Address #{n}" }
    sequence(:city) { |n| "City #{n}" }
    sequence(:state) { |n| "State #{n}" }
    sequence(:zipcode) { |n| "Zipcode #{n}" }
    role { 0 }
  end
end
