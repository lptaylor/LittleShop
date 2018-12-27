require 'rails_helper'

describe 'As a visitor' do
  before(:each) do
    @item_1 = create(:item)
    @item_2 = create(:item)

    @user = create(:user)
  end

  describe 'with added items in cart' do
    it 'I must register or login to finish process' do

      visit item_path(@item_1)
      click_button "Add Item to Cart"

      visit item_path(@item_2)
      click_button "Add Item to Cart"

      visit cart_path(@user)

      expect(page).to have_link("login")
      expect(page).to have_link("register")
      expect(page).to have_content("if you'd like to checkout, please login or register...")
    end
  end
end
