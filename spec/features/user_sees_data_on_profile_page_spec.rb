require 'rails_helper'

describe 'as a registered user' do
  describe ' on the registered user profile page' do
    it 'displays user information' do
      user = create(:user)

      visit root_path

      click_link "Login"

      fill_in :email, with: user.email
      fill_in :password, with: user.password

      click_button "Login"

      visit profile_path

      expect(page).to have_content(user.name)
      expect(page).to have_content(user.email)
      expect(page).to have_content(user.address)
      expect(page).to have_content(user.city)
      expect(page).to have_content(user.state)
      expect(page).to have_content(user.zipcode)
    end
  end
end
