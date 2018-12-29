require 'rails_helper'

describe 'Registered User' do
  describe 'when logged in' do
    before(:each) do
      @user = create(:user)
      @item_1 = create(:item)
      @item_2 = create(:item)

      visit root_path
      click_link "Login"

      fill_in :email, with: @user.email
      fill_in :password, with: @user.password

      click_button "Login"
    end
    it 'can see a button to checkout' do
      visit item_path(@item_1)

      click_button "Add Item to Cart"

      visit cart_path(@user)

      expect(page).to have_content("Check Out")
    end
    it 'can see full order with a status of pending' do
      visit item_path(@item_1)

      click_button "Add Item to Cart"

      visit item_path(@item_1)

      click_button "Add Item to Cart"

      visit item_path(@item_2)

      click_button "Add Item to Cart"

      visit cart_path(@user)

      click_link "Check Out"

      expect(current_path).to eq(profile_orders_path)

      expect(page).to have_content("Order Status: pending")
      expect(page).to have_content("Your order was created successfully")
      expect(page).to have_content("Total Items Ordered: 2")
    end
  end
end
