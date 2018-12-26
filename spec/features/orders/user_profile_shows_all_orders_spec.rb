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


      order_1 = create(:order, user: @user)
      order_1.order_items.create(
      order_item_1 = create(:order_item, item: item_1)
      order_item_2 = create(:order_item, item: item_2)

      order_2 = create(:order, user: @user)
      order_item_3 = create(:order_item, order: order_2, item: item_3)
      order_item_4 = create(:order_item, order: order_2, item: item_4)
      order_item_4 = create(:order_item, order: order_2, item: item_5)

      visit profile_path(@user)

      expect(page).to have_content(order_1.id)
      expect(page).to have_content(order_2.id)
    end
  end
end
