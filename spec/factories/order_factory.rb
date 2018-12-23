FactoryBot.define do
  factory :order do
    user
    order_status { "pending" }
  end
end
