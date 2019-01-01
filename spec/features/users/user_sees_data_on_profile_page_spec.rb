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

      expect(page).to have_content("NAME: #{user.name}")
      expect(page).to have_content("EMAIL: #{user.email}")
      expect(page).to have_content("ADDRESS: #{user.address}")
      expect(page).to have_content("CITY: #{user.city}")
      expect(page).to have_content("STATE: #{user.state}")
      expect(page).to have_content("ZIP: #{user.zipcode}")
      expect(page).to_not have_content(user.password)
      expect(page).to have_link("Edit Profile")
    end
  end
end
