require 'rails_helper'

describe 'As a visitor' do
  before(:each) do
    @item_1 = create(:item)
    @item_2 = create(:item)
    @item_3 = create(:item)

    @user = create(:user)
  end
  describe 'items can be added to cart' do
    it 'displays a message' do

      visit item_path(@item_1)

      click_button "Add Item to Cart"
      expect(page).to have_content("You now have 1 item in your shopping cart")
      expect(current_path).to eq(items_path)
      expect(page).to have_content("Shopping Cart: 1")

      visit item_path(@item_2)
      click_button "Add Item to Cart"
      expect(page).to have_content("Shopping Cart: 2")
    end
  end
  describe 'As a Visitor OR Registered user' do
    it 'can see message with empty cart' do

      visit cart_path

      expect(page).to have_content('your cart is empty')
    end
  end
    it 'can see item name when cart isnt empty' do
      item_5 = create(:item)

      visit item_path(item_5)

      click_button 'Add Item to Cart'

      visit cart_path(@user)

      expect(page).to have_content(item_5.item_name)
  end
    it 'can empty all items from cart' do
      visit item_path(@item_1)
      click_button 'Add Item to Cart'

      visit item_path(@item_2)
      click_button 'Add Item to Cart'

      visit item_path(@item_3)
      click_button 'Add Item to Cart'

      expect(page).to have_content("Shopping Cart: 3")

      visit cart_path(@user)
      click_link 'Empty My Cart'

      expect(page).to have_content("Shopping Cart: 0")
  end
    it 'can see attributes of each item on cart path' do
      item_5 = create(:item, price: 100)

      visit item_path(item_5)
      click_button 'Add Item to Cart'

      visit cart_path(@user)

      expect(page).to have_content(item_5.item_name)
      expect(page).to have_content(item_5.image_url)
      expect(page).to have_content(item_5.merchant_name)
      expect(page).to have_content("#{item_5.item_name} count: 1")
      expect(page).to have_content(item_5.total_for_item)
  end
    it 'can see grand total of all items in cart' do
      item_5 = create(:item, price: 100.00)
      item_6 = create(:item, price: 150.00)

      visit item_path(item_5)
      click_button 'Add Item to Cart'

      visit item_path(item_6)
      click_button 'Add Item to Cart'

      visit cart_path(@user)

      expect(page).to have_content("Cart Total: $#{item_5.price + item_6.price}")
  end
    it 'will only allow you to add based on inventory size' do
      item_7 = create(:item, inventory: 1)

      visit item_path(item_7)

      click_button 'Add Item to Cart'

      visit cart_path(@user)

      click_button "+"

      expect(page).to have_content("Requested More than Available")
  end
    it 'will remove item from cart if count is zero' do
      item_8 = create(:item, inventory: 1)

      visit item_path(item_8)

      click_button 'Add Item to Cart'

      visit cart_path(@user)

      click_button "-"

      expect(page).to_not have_content(item_8)
  end
end
