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
  describe 'items can be added to cart' do
    it 'displays a message' do

      visit item_path(@item_1)

      click_button "Add Item to Cart"
      expect(page).to have_content("You now have 1 item in your shopping cart")
      expect(current_path).to eq(items_path)
      expect(page).to have_content("Shopping Cart: 1")

    end

  end
end
