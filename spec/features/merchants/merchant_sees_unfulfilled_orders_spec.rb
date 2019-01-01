require 'rails_helper'

describe 'as a merchant' do
  before(:each) do

    @merch_1 = create(:user, role: 1, name: "merch_1")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@merch_1)
    @merch_2 = create(:user, role: 1, name: "merch_2")

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

      @item_1 = create(:item, user: @merch_1, inventory: 1000, price: 1)
      @item_2 = create(:item, user: @merch_1, inventory: 350, price: 2)
      @item_3 = create(:item, user: @merch_1, inventory: 800, price: 3)
      @item_4 = create(:item, user: @merch_1, inventory: 9, price: 4)
      @item_5 = create(:item, user: @merch_1, inventory: 500, price: 5)
      @item_6 = create(:item, user: @merch_1, inventory: 10000, price: 0.02)
      @item_7 = create(:item, user: @merch_1, inventory: 33333, price: 7)
      @item_8 = create(:item, user: @merch_2, inventory: 6666, price: 8)
      @item_9 = create(:item, user: @merch_1, inventory: 777, price: 9)
      @item_10 = create(:item, user: @merch_1, inventory: 33, price: 2500030)
      @item_11= create(:item, user: @merch_1, inventory: 44, price: 6000030)
      @item_12 = create(:item, user: @merch_1, inventory: 55, price: 20000030)
      @item_13 = create(:item, user: @merch_2, inventory: 500, price: 20000030)

      @order_1 = create(:order, user: @user_1)
      @order_2 = create(:order, user: @user_1)
      @order_3 = create(:order, user: @user_1)
      @order_4 = create(:order, user: @user_1)
      @order_5 = create(:order, user: @user_2, order_status: 2)
      @order_6 = create(:order, user: @user_2)
      @order_7 = create(:order, user: @user_2)
      @order_8 = create(:order, user: @user_3)
      @order_9 = create(:order, user: @user_3)
      @order_10 = create(:order, user: @user_5)
      @order_11 = create(:order, user: @user_4)
      @order_12 = create(:order, user: @user_4)
      @order_13 = create(:order, user: @user_4)

      @order_item_1 = create(:order_item, item: @item_13, order: @order_1, quantity: 300, fulfilled: false, created_at: 12.days.ago, updated_at: 10.days.ago, price: @item_1.price)
      @order_item_2 = create(:order_item, item: @item_2, order: @order_2, quantity: 175, fulfilled: false, created_at: 12.days.ago, updated_at: 9.days.ago, price: @item_2.price)
      @order_item_3 = create(:order_item, item: @item_3, order: @order_3, quantity: 400, fulfilled: false, created_at: 12.days.ago, updated_at: 4.days.ago, price: @item_3.price)
      @order_item_4 = create(:order_item, item: @item_4, order: @order_4, quantity: 9, fulfilled: false, created_at: 12.days.ago, updated_at: 2.days.ago, price: @item_4.price)
      @order_item_5 = create(:order_item, item: @item_5, order: @order_5, quantity: 200, fulfilled: true, created_at: 12.days.ago, updated_at: 1.days.ago, price: @item_5.price)
      @order_item_6 = create(:order_item, item: @item_6, order: @order_6, quantity: 700, fulfilled: false, created_at: 12.days.ago, updated_at: 5.days.ago, price: @item_6.price)
      @order_item_7 = create(:order_item, item: @item_7, order: @order_7, quantity: 6, fulfilled: false, created_at: 12.days.ago, updated_at: 5.days.ago, price: @item_7.price)
      @order_item_8 = create(:order_item, item: @item_8, order: @order_8, quantity: 5, fulfilled: false, created_at: 12.days.ago, updated_at: 3.days.ago, price: @item_8.price)
      @order_item_9 = create(:order_item, item: @item_9, order: @order_9, quantity: 4, fulfilled: false, created_at: 12.days.ago, updated_at: 5.days.ago, price: @item_9.price)
      @order_item_10 = create(:order_item, item: @item_10, order: @order_10, quantity: 30, fulfilled: false, created_at: 12.days.ago, updated_at: 5.days.ago, price: @item_10.price)
      @order_item_11 = create(:order_item, item: @item_11, order: @order_11, quantity: 25, fulfilled: false, created_at: 12.days.ago, updated_at: 5.days.ago, price: @item_11.price)
      @order_item_12 = create(:order_item, item: @item_12, order: @order_12, quantity: 50, fulfilled: false, created_at: 12.days.ago, updated_at: 11.days.ago, price: @item_12.price)
      @order_item_13 = create(:order_item, item: @item_1, order: @order_1, quantity: 250, fulfilled: false, created_at: 12.days.ago, updated_at: 10.days.ago, price: @item_1.price)
      @order_item_14 = create(:order_item, item: @item_13, order: @order_13, quantity: 250, fulfilled: false, created_at: 12.days.ago, updated_at: 10.days.ago, price: @item_1.price)
      visit '/dashboard'
    end

    it 'shows my pending orders only' do
      within '.pending-orders' do
        expect(page).to have_content(@order_1.id)
        expect(page).to have_content(@order_7.id)
        expect(page).to have_content(@order_9.id)
        expect(page).to_not have_content(@order_5.id)
        expect(page).to_not have_content(@order_13.id)
      end
    end

    it 'shows attributes for each order' do
      within '.pending-orders' do
        expect(page).to have_content(@order_1.created_at)
        expect(page).to have_content(@order_1.total_order_items)
        expect(page).to have_content(@order_1.total_order_price)
        expect(page).to have_content(@order_7.created_at)
        expect(page).to have_content(@order_7.total_order_items)
        expect(page).to have_content(@order_7.total_order_price)
        expect(page).to have_content(@order_9.created_at)
        expect(page).to have_content(@order_9.total_order_items)
        expect(page).to have_content(@order_9.total_order_price)
      end
    end
end
