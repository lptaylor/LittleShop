require 'rails_helper'

describe 'As a merchant' do
    before(:each) do
      @merchant = create(:user, role: 1)

      visit root_path
      click_link "Login"

      fill_in :email, with: @merchant.email
      fill_in :password, with: @merchant.password

      click_button "Login"
    end

    it 'Can see a link and navigate to my items' do
      expect(page).to have_link("My Items")

      click_link "My Items"

      expect(current_path).to eq(dashboard_items_path)
  end
end
