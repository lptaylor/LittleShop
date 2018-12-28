require 'rails_helper'

describe 'as an Admin' do
  it 'allows admin to edit users profile' do
    admin = create(:user, role: 2)
    user_1 = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_user_path(user_1)

    click_link "Edit Profile"

    new_name = "Wanda"
    new_email = "wanda@aol.com"
    new_password = "ILoveMom"
    new_address = "125 Main St."
    new_city = "Squirrel Town"
    new_state = "CO"
    new_zipcode = 12345

    fill_in :user_name, with: new_name
    fill_in :user_email, with: new_email
    fill_in :user_password, with: new_password
    fill_in :user_password_confirmation, with: new_password
    fill_in :user_address, with: new_address
    fill_in :user_city, with: new_city
    fill_in :user_state, with: new_state
    fill_in :user_zipcode, with: new_zipcode

    click_on "Update User"

    expect(page).to have_content("Name: #{new_name}")
    expect(page).to have_content("Email: #{new_email}")
    expect(page).to have_content("#{new_name}'s information has been updated.")
    expect(page).to have_content("Logged in as: #{admin.name}")
    expect(page).to_not have_content("Your information has been updated.")
    expect(page).to_not have_content("Name: #{user_1.name}")
    expect(page).to_not have_content("Email: #{user_1.email}")
  end
end
