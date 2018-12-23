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
    
  end

end
