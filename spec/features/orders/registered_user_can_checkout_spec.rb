require 'rails_helper'

describe 'Registered User' do
  describe 'when logged in' do
    before(:each) do
      @user = create(:user)
      @item_1 = create(:item, inventory: 20)
      @item_2 = create(:item, inventory: 10)

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

      visit cart_path(@user)
      click_link "Check Out"

      expect(current_path).to eq(profile_orders_path)

      expect(page).to have_content("Order Status: pending")
      expect(page).to have_content("Your order was created successfully")
    end
    it 'if order is pending, user sees a link to cancel order' do
      visit item_path(@item_1)
      click_button "Add Item to Cart"

      visit item_path(@item_1)
      click_button "Add Item to Cart"

      visit item_path(@item_2)
      click_button "Add Item to Cart"

      visit cart_path(@user)
      click_link "Check Out"

      expect(page).to have_button("Cancel Order")

      click_button "Cancel Order"

      expect(current_path).to eq(profile_path(@user))
      expect(page).to have_content("Order was successfully cancelled")
    end
    it 'gives each row in order items a status of  not fulfilled' do
      visit item_path(@item_1)
      click_button "Add Item to Cart"

      visit item_path(@item_2)
      click_button "Add Item to Cart"

      visit cart_path(@user)
      click_link "Check Out"

      expect(@user.orders.first.order_status).to eq("pending")

      click_button "Cancel Order"

      expect(@item_1.order_items.first.fulfilled).to eq(false)
      expect(@item_2.order_items.first.fulfilled).to eq(false)
      expect(@user.orders.first.order_status).to eq("cancelled")
    end
    it 'item quantities returned to original inventory' do
      visit item_path(@item_2)

      expect(@item_2.inventory).to eq(10)
      click_button "Add Item to Cart"

      visit item_path(@item_2)
      click_button "Add Item to Cart"

      visit cart_path(@user)

      click_link "Check Out"
      expect(@item_2.reload.inventory).to eq(8)

      click_button "Cancel Order"

      expect(@item_2.reload.inventory).to eq(10)
    end
    it 'different item quantities returned to original inventory' do
      visit item_path(@item_1)
      expect(@item_1.inventory).to eq(20)
      click_button "Add Item to Cart"

      visit item_path(@item_2)
      expect(@item_2.inventory).to eq(10)
      click_button "Add Item to Cart"

      visit cart_path(@user)

      click_link "Check Out"
      expect(@item_1.reload.inventory).to eq(19)
      expect(@item_2.reload.inventory).to eq(9)

      click_button "Cancel Order"

      expect(@item_1.reload.inventory).to eq(20)
      expect(@item_2.reload.inventory).to eq(10)
    end
    it 'cart shows empty after hitting checkout' do
      visit item_path(@item_1)
      click_button "Add Item to Cart"

      click_link "Shopping Cart"
      click_link "Check Out"

      expect(page).to have_content("Shopping Cart: 0")
    end
  end
end
