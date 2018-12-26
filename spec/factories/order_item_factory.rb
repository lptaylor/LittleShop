FactoryBot.define do
  factory :order_item do
    order
    item
    sequence(:price) { |n| ((n + 2) * 0.75) }
    sequence(:quantity) { |n| n + 1 }
    fulfilled { false }
  end
end
