require 'rails_helper'

describe 'As a visitor' do
  it 'can register to be a user' do
    visit root_path

    username = "Wanda123"
    address = "123 AbC St"
    city = "Denver"
    state = "Colorado"
    zipcode = 80128
    email = "jeff@aol.com"
    password = "dogsaregreat"


    click_on "Register"

    expect(current_path).to eq(register_path)

    fill_in :user_username, with: username
    fill_in :user_password, with: password
    fill_in :user_address, with: address
    fill_in :user_city, with: city
    fill_in :user_state, with: state
    fill_in :user_zipcode, with: zipcode
    fill_in :user_email, with: email

    click_on "Create User"

    expect(page).to have_content("Welcome, #{username}")
  end
end
