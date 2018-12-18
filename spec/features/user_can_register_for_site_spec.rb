require 'rails_helper'

describe 'As a visitor' do
  it 'can register to be a user' do
    user = build(:user)

    visit root_path

    click_on "Register"

    expect(current_path).to eq(register_path)


    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    fill_in :user_address, with: user.address
    fill_in :user_city, with: user.city
    fill_in :user_state, with: user.state
    fill_in :user_zipcode, with: user.zipcode

    click_on "Create User"

    expect(page).to have_content("Welcome, #{user.email}")
  end
end
