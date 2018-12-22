FactoryBot.define do
  factory :order_item do
    order
    item
    fulfilled { false }
  end
end
