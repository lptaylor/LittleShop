require 'rails_helper'

describe 'as a registered user' do
  describe 'when logged in' do
    before(:each) do
      @user = create(:user)

      visit root_path
      click_link "Login"

      fill_in :email, with: @user.email
      fill_in :password, with: @user.password

      click_button "Login"
    end
    it 'can edit its own profile' do
      new_name = "Tom"
      new_email = "test@test.com"
      new_password = "ILoveMom"
      new_address = "125 Main St."
      new_city = "Zaregerege"
      new_state = "ZZ"
      new_zipcode = 12345

      click_link "Edit Profile"

      fill_in :user_name, with: new_name
      fill_in :user_email, with: new_email
      fill_in :user_password, with: new_password
      fill_in :user_password_confirmation, with: new_password
      fill_in :user_address, with: new_address
      fill_in :user_city, with: new_city
      fill_in :user_state, with: new_state
      fill_in :user_zipcode, with: new_zipcode

      click_on "Update User"

      expect(current_path).to eq(profile_path)
      expect(page).to have_content(new_name)
      expect(page).to have_content(new_email)
      expect(page).to have_content(new_address)
      expect(page).to have_content(new_city)
      expect(page).to have_content(new_state)
      expect(page).to have_content(new_zipcode)
      expect(page).to have_content("Your information has been updated.")

      expect(current_path).to_not eq(profile_edit_path)
      expect(page).to_not have_content(@user.name)
      expect(page).to_not have_content(@user.email)
      expect(page).to_not have_content(@user.address)
      expect(page).to_not have_content(@user.city)
      expect(page).to_not have_content(@user.state)
      expect(page).to_not have_content(@user.zipcode)
    end

    it 'shows a flash message if a duplicate email is entered' do
      user_2 = create(:user, email: "ali@aol.com")
      new_name = "Tom"
      new_email = "test@test.com"
      new_password = "ILoveMom"
      new_address = "125 Main St."
      new_city = "Zaregerege"
      new_state = "ZZ"
      new_zipcode = 12345

      click_link "Edit Profile"

      fill_in :user_name, with: new_name
      fill_in :user_email, with: user_2.email
      fill_in :user_password, with: new_password
      fill_in :user_password_confirmation, with: new_password
      fill_in :user_address, with: new_address
      fill_in :user_city, with: new_city
      fill_in :user_state, with: new_state
      fill_in :user_zipcode, with: new_zipcode

      click_on "Update User"
      expect(page).to have_content("The email entered is already in use")
      expect(page).to have_button("Update User")
      expect(page).to_not have_content("Your information has been updated.")
      expect(page).to_not have_content(user_2.email)
    end
  end
end
