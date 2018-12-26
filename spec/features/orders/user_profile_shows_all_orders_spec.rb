require 'rails_helper'

describe 'As a registered user' do
  describe 'when I visit my profile page' do
    before(:each) do
      @user = create(:user)

      visit root_path
      click_link "Login"

      fill_in :email, with: @user.email
      fill_in :password, with: @user.password

      click_button "Login"
    end

    it 'displays information about all orders' do
      item_1 = create(:item)
      item_2 = create(:item)
      item_3 = create(:item)
      item_4 = create(:item)
      item_5 = create(:item)
      item_6 = create(:item)

      order_1 = create(:order, user: @user, order_status: 0)
      order_item_1 = create(:order_item, order: order_1, item: item_1)
      order_item_2 = create(:order_item, order: order_1, item: item_2)

      order_2 = create(:order, user: @user, order_status: 1)
      order_item_3 = create(:order_item, order: order_2, item: item_3)
      order_item_4 = create(:order_item, order: order_2, item: item_4)
      order_item_5 = create(:order_item, order: order_2, item: item_5)

      order_3 = create(:order, user: @user, order_status: 2)
      order_item_6 = create(:order_item, order: order_3, item: item_6)

      user_2 = create(:user)
      order_4 =create(:order, user: user_2)
      order_item_5 = create(:order_item, order: order_4, item: item_1)
      order_item_6 = create(:order_item, order: order_4, item: item_2)

      visit profile_path(@user)

      within ".all-orders" do
        expect(page).to have_content("Order Id: #{order_1.id}")
        expect(page).to have_content("Order Id: #{order_2.id}")
        expect(page).to have_content("Order Id: #{order_3.id}")
        expect(page).to_not have_link("#{order_4.id}")
      end

      within "#order-0" do
        expect(page).to have_link("#{order_1.id}")
        expect(page).to have_content("Order Placed On: #{order_1.created_at.to_date}")
        expect(page).to have_content("Order Status: #{order_1.order_status}")
        expect(page).to have_content("Total Items Ordered: #{order_1.total_order_items}")
      end

      within "#order-1" do
        expect(page).to have_link("#{order_2.id}")
        expect(page).to have_content("Order Placed On: #{order_2.created_at.to_date}")
        expect(page).to have_content("Order Status: #{order_2.order_status}")
        expect(page).to have_content("Total Items Ordered: #{order_2.total_order_items}")
      end

      within "#order-2" do
        expect(page).to have_link("#{order_3.id}")
        expect(page).to have_content("Order Placed On: #{order_3.created_at.to_date}")
        expect(page).to have_content("Order Status: #{order_3.order_status}")
        expect(page).to have_content("Total Items Ordered: #{order_3.total_order_items}")
      end

    end
  end

end
