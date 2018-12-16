require 'rails_helper'

describe 'As a user' do
  describe 'when they visit the welcome page' do
    it 'shows a navigation bar' do
      visit root_path

      click_link "Homepage"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Welcome!")

      visit root_path
      click_link "Items"

      expect(current_path).to eq(items_path)
      expect(page).to have_content("Items")

      visit root_path
      click_link "Merchants"

      expect(current_path).to eq(merchants_path)
      expect(page).to have_content("All Merchants")

      visit root_path
      click_link "Shopping Cart"

      expect(current_path).to eq(cart_index_path)
      expect(page).to have_content("Shopping Cart")

      visit root_path
      click_link "Login"

      expect(current_path).to eq(login_index_path)
      expect(page).to have_content("Login")

      visit root_path
      click_link "Register"

      expect(current_path).to eq(register_index_path)
      expect(page).to have_content("Register")

    end

  end
end
