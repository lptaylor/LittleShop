require 'rails_helper'

describe 'As a visitor' do
  before(:each) do
    @item_1 = create(:item)
    @item_2 = create(:item)
    @item_3 = create(:item)
    @item_4 = create(:item)
    @item_5 = create(:item)
    @item_6 = create(:item)

    @user = create(:user)
  end

  describe 'items can be manipulated in cart' do
    it 'can see link to remove item' do

      visit item_path(@item_1)

      click_button "Add Item to Cart"
      expect(page).to have_content("You now have 1 item in your shopping cart")
      expect(current_path).to eq(items_path)
      expect(page).to have_content("Shopping Cart: 1")

      visit cart_path(@user)

      click_link "Remove From Cart"

      expect(page).to_not have_content(@item_1.item_name)
      expect(page).to_not have_content("Remove From Cart")
    end
    it 'can increase count of item for purchase' do
      item_1 = create(:item, inventory: 10, price: 10.00)

      visit item_path(item_1)
      click_button "Add Item to Cart"

      visit cart_path(@user)

      click_button "+"

      expect(page).to have_content("Cart Total: $20.00")

      click_button "-"

      expect(page).to have_content("Cart Total: $10.00")
    end
  end
end
