require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  describe 'relationships' do
    it { should belong_to(:order) }
    it { should belong_to(:item) }
  end

  describe 'instance methods' do
    it 'can calculate the subtotal for items on an order' do
      user = create(:user)
      item_1 = create(:item)
      item_2 = create(:item)

      order_1 = create(:order, user: user)
      order_item_1 = create(:order_item, order: order_1, item: item_1, price: 2.5, quantity: 5)

      expect(order_item_1.subtotal).to eq(12.5)
    end
    it 'can find orders for merchant' do
      user = create(:user, role: 1)
      item_1 = create(:item, user: user)
      item_2 = create(:item, user: user)

      order_1 = create(:order, user: user)
      order_item_1 = create(:order_item, order: order_1, item: item_1, price: 2.5, quantity: 5)
      order_item_2 = create(:order_item, order: order_1, item: item_2, price: 3.1, quantity: 10)

      query = OrderItem.orders_for_merchant(order_1.id, user.id)

      expect(query).to eq([order_item_1, order_item_2])
    end
  end
end
