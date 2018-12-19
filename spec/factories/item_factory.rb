FactoryBot.define do
  factory :item, class: Item do
    association(:user, role: 1)
    sequence(:item_name) { Faker::Currency.name }
    sequence(:image_url) { Faker::Dog.name }
    sequence(:inventory) { Faker::Number.between(1, 1000) }
    sequence(:price) { Faker::Number.between(1, 50_000) }
    sequence(:description) { Faker::FamousLastWords.last_words  }
  end
end
