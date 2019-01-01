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
    it 'updates inventory of item when order created or cancelled' do
      user = create(:user)
      item_1 = create(:item, inventory: 5)

      order_1 = create(:order, user: user)
      create(:order_item, order: order_1, item: item_1, price: 2.5, quantity: 1)

      order_1.update_inventory

      expect(order_1.items.first.inventory).to eq(4)

      order_1.add_back_inventory

      expect(order_1.items.first.inventory).to eq(5)
    end
  end

  describe 'class methods' do
    before(:each) do
      @merch_1 = create(:user, role: 1, name: "merch_1")
      @merch_2 = create(:user, role: 1, name: "merch_2")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@merch_1)

      @user_1 = create(:user, city: "Springfield", state: "Colorado")
      @user_2 = create(:user, city: "Springfield", state: "Colorado")
      @user_3 = create(:user, city: "Springfield", state: "Colorado")
      @user_4 = create(:user, city: "Dayton", state: "Florida")

      @item_1 = create(:item, user: @merch_1, inventory: 1000, price: 1)
      @item_2 = create(:item, user: @merch_1, inventory: 350, price: 2)
      @item_3 = create(:item, user: @merch_1, inventory: 800, price: 3)
      @item_4 = create(:item, user: @merch_1, inventory: 9, price: 4)
      @item_5 = create(:item, user: @merch_1, inventory: 500, price: 5)
      @item_6 = create(:item, user: @merch_2, inventory: 10000, price: 0.02)

      @order_1 = create(:order, user: @user_1)
      @order_2 = create(:order, user: @user_1)
      @order_3 = create(:order, user: @user_1)
      @order_4 = create(:order, user: @user_1)
      @order_5 = create(:order, user: @user_2, order_status: 2)
      @order_6 = create(:order, user: @user_2)

      @order_item_1 = create(:order_item, item: @item_1, order: @order_1, quantity: 300, fulfilled: false, created_at: 12.days.ago, updated_at: 10.days.ago, price: @item_1.price)
      @order_item_2 = create(:order_item, item: @item_2, order: @order_2, quantity: 175, fulfilled: false, created_at: 12.days.ago, updated_at: 9.days.ago, price: @item_2.price)
      @order_item_3 = create(:order_item, item: @item_3, order: @order_3, quantity: 400, fulfilled: false, created_at: 12.days.ago, updated_at: 4.days.ago, price: @item_3.price)
      @order_item_4 = create(:order_item, item: @item_4, order: @order_4, quantity: 9, fulfilled: false, created_at: 12.days.ago, updated_at: 2.days.ago, price: @item_4.price)
      @order_item_5 = create(:order_item, item: @item_5, order: @order_5, quantity: 200, fulfilled: true, created_at: 12.days.ago, updated_at: 1.days.ago, price: @item_5.price)
      @order_item_6 = create(:order_item, item: @item_6, order: @order_6, quantity: 700, fulfilled: false, created_at: 12.days.ago, updated_at: 5.days.ago, price: @item_6.price)

    end

    it 'returns only items for current_merchant that are pending' do
      pending_orders = Order.pending_orders(@merch_1.id)

      expect(pending_orders).to eq([@order_1, @order_2, @order_3, @order_4])
    end
  end
  describe 'statistics methods' do
    before(:each) do
      @user_1 = create(:user, city: "Springfield", state: "Colorado")
      @user_2 = create(:user, city: "Springfield", state: "Colorado")
      @user_3 = create(:user, city: "Springfield", state: "Colorado")
      @user_4 = create(:user, city: "Dayton", state: "Florida")
      @user_5 = create(:user, city: "Dayton", state: "Florida")
      @user_6 = create(:user, city: "Springfield", state: "Ohio")
      @user_7 = create(:user, city: "Dayton", state: "Florida")
      @user_8 = create(:user, city: "Springfield", state: "Colorado")
      @user_9 = create(:user, city: "Springfield", state: "Ohio")
      @user_10 = create(:user, city: "Blue Field", state: "D.C.")
      @user_11 = create(:user, city: "Miami", state: "Colorado")
      @user_12 = create(:user, city: "Blue Field", state: "Washington")

      @merch_1 = create(:user, role: 1, name: "merch_1")
      @merch_2 = create(:user, role: 1, name: "merch_2")
      @merch_3 = create(:user, role: 1, name: "merch_3")
      @merch_4 = create(:user, role: 1, name: "merch_4")
      @merch_5 = create(:user, role: 1, name: "merch_5")
      @merch_6 = create(:user, role: 1, name: "merch_6")
      @merch_7 = create(:user, role: 1, name: "merch_7")
      @merch_8 = create(:user, role: 1, name: "merch_8")
      @merch_9 = create(:user, role: 1, name: "merch_9")
      @merch_10 = create(:user, role: 1, name: "merch_10")
      @merch_11 = create(:user, role: 1, name: "merch_11")
      @merch_12 = create(:user, role: 1, name: "merch_12")

      @item_1 = create(:item, user: @merch_1, price: 1)
      @item_2 = create(:item, user: @merch_2, price: 2)
      @item_3 = create(:item, user: @merch_3, price: 3)
      @item_4 = create(:item, user: @merch_4, price: 4)
      @item_5 = create(:item, user: @merch_5, price: 5)
      @item_6 = create(:item, user: @merch_6, price: 0.02)
      @item_7 = create(:item, user: @merch_7, price: 7)
      @item_8 = create(:item, user: @merch_8, price: 8)
      @item_9 = create(:item, user: @merch_9, price: 9)
      @item_10 = create(:item, user: @merch_10, price: 2500030)
      @item_11= create(:item, user: @merch_11, price: 6000030)
      @item_12 = create(:item, user: @merch_12, price: 20000030)

      @order_1 = create(:order, user: @user_1)
      @order_2 = create(:order, user: @user_2)
      @order_3 = create(:order, user: @user_3)
      @order_4 = create(:order, user: @user_4)
      @order_5 = create(:order, user: @user_5)
      @order_6 = create(:order, user: @user_6)
      @order_7 = create(:order, user: @user_7)
      @order_8 = create(:order, user: @user_8)
      @order_9 = create(:order, user: @user_9)
      @order_10 = create(:order, user: @user_10)
      @order_11 = create(:order, user: @user_11)
      @order_12 = create(:order, user: @user_12)

      @order_item_1 = create(:order_item, item: @item_1, order: @order_1, quantity: 300, fulfilled: true, created_at: 12.days.ago, updated_at: 10.days.ago, price: @item_1.price)
      @order_item_2 = create(:order_item, item: @item_2, order: @order_2, quantity: 175, fulfilled: true, created_at: 12.days.ago, updated_at: 9.days.ago, price: @item_2.price)
      @order_item_3 = create(:order_item, item: @item_3, order: @order_3, quantity: 400, fulfilled: false, created_at: 12.days.ago, updated_at: 4.days.ago, price: @item_3.price)
      @order_item_4 = create(:order_item, item: @item_4, order: @order_4, quantity: 9, fulfilled: true, created_at: 12.days.ago, updated_at: 2.days.ago, price: @item_4.price)
      @order_item_5 = create(:order_item, item: @item_5, order: @order_5, quantity: 200, fulfilled: true, created_at: 12.days.ago, updated_at: 1.days.ago, price: @item_5.price)
      @order_item_6 = create(:order_item, item: @item_6, order: @order_6, quantity: 700, fulfilled: true, created_at: 12.days.ago, updated_at: 5.days.ago, price: @item_6.price)
      @order_item_7 = create(:order_item, item: @item_7, order: @order_7, quantity: 6, fulfilled: true, created_at: 12.days.ago, updated_at: 5.days.ago, price: @item_7.price)
      @order_item_8 = create(:order_item, item: @item_8, order: @order_8, quantity: 5, fulfilled: true, created_at: 12.days.ago, updated_at: 3.days.ago, price: @item_8.price)
      @order_item_9 = create(:order_item, item: @item_9, order: @order_9, quantity: 4, fulfilled: true, created_at: 12.days.ago, updated_at: 5.days.ago, price: @item_9.price)
      @order_item_10 = create(:order_item, item: @item_10, order: @order_10, quantity: 30, fulfilled: true, created_at: 12.days.ago, updated_at: 5.days.ago, price: @item_10.price)
      @order_item_11 = create(:order_item, item: @item_11, order: @order_11, quantity: 25, fulfilled: true, created_at: 12.days.ago, updated_at: 5.days.ago, price: @item_11.price)
      @order_item_12 = create(:order_item, item: @item_12, order: @order_12, quantity: 50, fulfilled: true, created_at: 12.days.ago, updated_at: 11.days.ago, price: @item_12.price)
    end

    it 'returns orders with highest quantity' do
        top_orders_dirty = Order.largest_orders
        top_orders = top_orders_dirty.map {|order| order.id}
        expect(top_orders).to eq([@order_6.id, @order_1.id, @order_5.id])
    end
  end
end
