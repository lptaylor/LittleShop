require 'rails_helper'

describe 'as an Admin' do
  describe 'when they visit a users show page' do
    it 'shows all the users order information' do
      admin = create(:user, role: 2)
      user_1 = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      item_1 = create(:item)
      item_2 = create(:item)
      item_3 = create(:item)
      item_4 = create(:item)
      item_5 = create(:item)
      item_6 = create(:item)

      order_1 = create(:order, user: user_1, order_status: 0)
      order_item_1 = create(:order_item, order: order_1, item: item_1)
      order_item_2 = create(:order_item, order: order_1, item: item_2)

      order_2 = create(:order, user: user_1, order_status: 1)
      order_item_3 = create(:order_item, order: order_2, item: item_3)
      order_item_4 = create(:order_item, order: order_2, item: item_4)
      order_item_5 = create(:order_item, order: order_2, item: item_5)

      visit admin_user_path(user_1)

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

    end
  end
end
