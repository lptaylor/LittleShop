require 'rails_helper'

describe 'As a registered user' do
  describe 'when I visit an order show page' do
    it 'displays information about the order' do
      user = create(:user)
      item_1 = create(:item)
      item_2 = create(:item)

      order_1 = create(:order, user: user)
        create(:order_item, order: order_1, item: item_1)
        create(:order_item, order: order_1, item: item_2)

      visit order_path(order_1)
      
      expect(page).to have_content(order_1.id)
      expect(page).to have_content(order_1.created_at)
      expect(page).to have_content(order_1.updated_at)
      expect(page).to have_content(item_1.item_name)
      expect(page).to have_content(item_1.description)
      expect(page).to have_content(order_1.total_order_items)
      expect(page).to have_content(order_1.total_order_price)
    end
  end
end
