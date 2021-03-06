require 'rails_helper'

describe 'as a user' do
  describe 'when they visit the items index page' do
    it 'shows statistics about all items' do
      user = create(:user)
      item_1 = create(:item)
      item_2 = create(:item)
      item_3 = create(:item)
      item_4 = create(:item)
      item_5 = create(:item)
      item_6 = create(:item)
      item_7 = create(:item)
      item_8 = create(:item)
      item_9 = create(:item)
      item_10 = create(:item)
      item_11= create(:item)
      item_12 = create(:item)

      order_1 = create(:order, user: user)
      order_2 = create(:order, user: user)
      order_3 = create(:order, user: user)
      order_4 = create(:order, user: user)
      order_5 = create(:order, user: user)
      order_6 = create(:order, user: user)
      order_7 = create(:order, user: user)
      order_8 = create(:order, user: user)
      order_9 = create(:order, user: user)
      order_10 = create(:order, user: user)
      order_11 = create(:order, user: user)
      order_12 = create(:order, user: user)
      #
      order_item_1 = create(:order_item, item: item_1, order: order_1, quantity: 12, fulfilled: true)
      order_item_2 = create(:order_item, item: item_2, order: order_2, quantity: 11, fulfilled: true)
      order_item_3 = create(:order_item, item: item_3, order: order_3, quantity: 10, fulfilled: true)
      order_item_4 = create(:order_item, item: item_4, order: order_4, quantity: 9, fulfilled: true)
      order_item_5 = create(:order_item, item: item_5, order: order_5, quantity: 8, fulfilled: true)
      order_item_6 = create(:order_item, item: item_6, order: order_6, quantity: 7, fulfilled: true)
      order_item_7 = create(:order_item, item: item_7, order: order_7, quantity: 6, fulfilled: true)
      order_item_8 = create(:order_item, item: item_8, order: order_8, quantity: 5, fulfilled: true)
      order_item_9 = create(:order_item, item: item_9, order: order_9, quantity: 4, fulfilled: true)
      order_item_10 = create(:order_item, item: item_10, order: order_10, quantity: 3, fulfilled: true)
      order_item_11 = create(:order_item, item: item_11, order: order_11, quantity: 2, fulfilled: true)
      order_item_12 = create(:order_item, item: item_12, order: order_12, quantity: 1, fulfilled: true)

      visit items_path

      within ".most-popular" do
        expect(page).to have_content(item_1.item_name)
        expect(page).to have_content(item_2.item_name)
        expect(page).to have_content(item_3.item_name)
        expect(page).to have_content(item_4.item_name)
        expect(page).to have_content(item_5.item_name)
      end

      within ".least-popular" do
        expect(page).to have_content(item_8.item_name)
        expect(page).to have_content(item_9.item_name)
        expect(page).to have_content(item_10.item_name)
        expect(page).to have_content(item_11.item_name)
        expect(page).to have_content(item_12.item_name)
      end

      within ".stats-container" do
        expect(page).to_not have_content(item_6.item_name)
        expect(page).to_not have_content(item_7.item_name)
      end
    end
  end
end
