require 'rails_helper'

describe 'As a visitor' do
  it 'can register to be a user' do
    user = build(:user)

    visit root_path
    click_on "Register"

    expect(current_path).to eq(register_path)

    fill_in :user_name, with: user.name
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    fill_in :user_password_confirmation, with: user.password
    fill_in :user_address, with: user.address
    fill_in :user_city, with: user.city
    fill_in :user_state, with: user.state
    fill_in :user_zipcode, with: user.zipcode

    click_on "Create User"

    expect(page).to have_content("Welcome, #{user.email}")
    expect(current_path).to eq(profile_path)
  end

  it 'displays flash message for a successful registration' do
    user = build(:user)

    visit root_path
    click_on "Register"

    expect(current_path).to eq(register_path)

    fill_in :user_name, with: user.name
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    fill_in :user_password_confirmation, with: user.password
    fill_in :user_address, with: user.address
    fill_in :user_city, with: user.city
    fill_in :user_state, with: user.state
    fill_in :user_zipcode, with: user.zipcode

    click_on "Create User"

    expect(page).to have_content("You are now registered & logged in!")
  end

  it 'will not allow registration if details are missing' do
    user = build(:user)

    visit root_path
    click_on "Register"

    fill_in :user_name, with: user.name
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    fill_in :user_password_confirmation, with: user.password
    fill_in :user_city, with: user.city
    fill_in :user_state, with: user.state
    fill_in :user_zipcode, with: user.zipcode

    click_on "Create User"

    expect(current_path).to eq(users_path)
    expect(page).to have_content("Error: Missing required information")
  end





end
