require 'rails_helper'

describe 'Merchant, Admin or Reg User' do
  before(:each) do
    visit root_path
    click_link "Login"
  end
  describe 'can logout Admin' do
    it 'then goes to welcome page with empty cart' do
      user_1 = create(:user, role: 0)
      item_1 = create(:item)

      fill_in :email, with: user_1.email
      fill_in :password, with: user_1.password
      click_button "Login"

      visit item_path(item_1)
      click_button "Add Item to Cart"

      click_on "Logout"

      expect(page).to have_content("You are now logged out")
      expect(page).to have_content("Shopping Cart: 0")
    end
  end

  describe 'can logout Merchant' do
    it 'then goes to welcome page with empty cart' do
      user_2 = create(:user, role: 1)
      item_2 = create(:item)

      fill_in :email, with: user_2.email
      fill_in :password, with: user_2.password
      click_button "Login"

      visit item_path(item_2)
      click_button "Add Item to Cart"

      click_on "Logout"

      expect(page).to have_content("You are now logged out")
      expect(page).to have_content("Shopping Cart: 0")
    end
  end

  describe 'can logout Admin' do
    it 'then goes to welcome page with empty cart' do
      user_3 = create(:user, role: 2)
      item_3 = create(:item)

      fill_in :email, with: user_3.email
      fill_in :password, with: user_3.password
      click_button "Login"

      visit item_path(item_3)
      click_button "Add Item to Cart"

      click_on "Logout"

      expect(page).to have_content("You are now logged out")
      expect(page).to have_content("Shopping Cart: 0")
    end
  end
end
