require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should have_many(:order_items) }
    it { should have_many(:items).through(:order_items) }
  end
  describe 'validations' do
    it {should validate_presence_of(:order_status)}
    it {should validate_presence_of(:user_id)}
  end

  describe 'instance methods' do
    it 'can calculate the subtotal for items on an order' do
      user = create(:user)
      item_1 = create(:item)
      item_2 = create(:item)

      order_1 = create(:order, user: user)
      order_item_1 = create(:order_item, order: order_1, item: item_1, price: 2.5, quantity: 5)
      order_item_2 = create(:order_item, order: order_1, item: item_2, price: 2, quantity: 1)

      expect(order_1.total_order_items).to eq(6)
      expect(order_1.total_order_price).to eq(14.5)
    end

  end
end
