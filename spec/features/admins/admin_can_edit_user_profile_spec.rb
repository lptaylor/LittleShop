require 'rails_helper'

describe 'as an Admin' do
  it 'allows admin to edit users profile' do
    admin = create(:user, role: 2)
    user_1 = create(:user)
    user_2 = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_user_path(user_1)

    click_link "Edit Profile"

    expect(current_path).to eq(edit_user_path(user_1))

    admin = create(:user, role: 2)
    user_1 = create(:user)
    user_2 = create(:user)

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
    binding.pry
    click_on "Update User"
    save_and_open_page
    expect(current_path).to eq(admin_user_path(user_1))
  end
end
