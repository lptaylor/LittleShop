require 'rails_helper'

describe 'As a visitor' do
  it 'can register to be a user' do
    visit root_path

    user_name = "Wanda123"
    address = "123 AbC St"
    city = "Denver"
    state = "Colorado"
    zipcode = 80128
    email = "jeff@aol.com"
    password = "dogsaregreat"
    permissions = "user"


    click_on "Register"

    expect(current_path).to eq(new_user_path)

    fill_in :user_user_name, with: user_name
    fill_in :user_password, with: "password"
    fill_in :user_address, with: "password"
    fill_in :user_city, with: "password"
    fill_in :user_state, with: "password"
    fill_in :user_zipcode, with: "password"
    fill_in :user_email, with: "password"
    fill_in :user_email, with: "password"

    click_on "Create User"

    expect(page).to have_content("Welcome, #{user_name}")
  end
end
