require 'rails_helper'

describe 'as an Admin' do
  describe 'when I visit a users show page and click link for an orders show page' do
    it 'shows all order information' do
      admin = create(:user, role: 2)
      user_1 = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      item_1 = create(:item)
      item_2 = create(:item)

      order_1 = create(:order, user: user_1, order_status: 0)
      order_item_1 = create(:order_item, order: order_1, item: item_1)
      order_item_2 = create(:order_item, order: order_1, item: item_2)

      visit admin_user_path(user_1)

      click_link "#{order_1.id}"

      expect(current_path).to eq(admin_order_path(order_1))

      expect(page).to have_content("Logged in as: #{admin.name}")

      within ".order-item-0" do
        expect(page).to have_content("Name: #{item_1.item_name}")
        expect(page).to have_content("Description: #{item_1.description}")
        expect(page).to have_content("Price: $#{order_item_1.price}")
        expect(page).to have_content("Quantity: #{order_item_1.quantity}")
      end

      within ".order-item-1" do
        expect(page).to have_content("Name: #{item_2.item_name}")
        expect(page).to have_content("Description: #{item_2.description}")
        expect(page).to have_content("Price: $#{(order_item_2.price)}")
        expect(page).to have_content("Quantity: #{order_item_2.quantity}")
      end

      within ".order-info" do
        expect(page).to have_content("Order Placed On: #{order_1.created_at.to_date}")
        expect(page).to have_content("Order Last Updated: #{order_1.updated_at.to_date}")
        expect(page).to have_content("Order Status: #{order_1.order_status}")
        expect(page).to have_content("Number of Items in Order: #{order_1.total_order_items}")
        expect(page).to have_content("Total Order Price: $#{order_1.total_order_price}")
      end
    end
    it 'can cancel order and goes back to admin order path' do
      admin = create(:user, role: 2)
      user_1 = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      item_3 = create(:item)
      item_4 = create(:item)

      order_2 = create(:order, user: user_1, order_status: 0)
      create(:order_item, order: order_2, item: item_3)
      create(:order_item, order: order_2, item: item_4)

      visit admin_user_path(user_1)

      click_link "#{order_2.id}"

      click_link "Cancel This Order"
      expect(page).to have_content('users order was successfully cancelled')
    end
  end
end
