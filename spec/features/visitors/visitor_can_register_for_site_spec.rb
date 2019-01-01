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
    create(:user, email: "bob@gmail.com")


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

  it 'will not allow registration if email is not unique' do
    user_1 = create(:user, email: "bob@gmail.com")

    visit root_path
    click_on "Register"

    fill_in :user_name, with: user_1.name
    fill_in :user_email, with: user_1.email
    fill_in :user_password, with: user_1.password
    fill_in :user_password_confirmation, with: user_1.password
    fill_in :user_city, with: user_1.city
    fill_in :user_state, with: user_1.state
    fill_in :user_zipcode, with: user_1.zipcode

    click_on "Create User"

    user_2 = build(:user, email: "bob@gmail.com")

    visit root_path
    click_on "Register"

    fill_in :user_name, with: user_2.name
    fill_in :user_email, with: user_2.email
    fill_in :user_password, with: user_2.password
    fill_in :user_password_confirmation, with: user_2.password
    fill_in :user_city, with: user_2.city
    fill_in :user_state, with: user_2.state
    fill_in :user_zipcode, with: user_2.zipcode

    click_on "Create User"

    expect(current_path).to eq(users_path)
    expect(page).to have_content("Alert: Email is already in use")
  end

  it 'confirms password' do
    user = build(:user)
    create(:user, email: "bob@gmail.com")

    visit root_path
    click_on "Register"

    fill_in :user_name, with: user.name
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    fill_in :user_password_confirmation, with: "dogparty"
    fill_in :user_address, with: user.address
    fill_in :user_city, with: user.city
    fill_in :user_state, with: user.state
    fill_in :user_zipcode, with: user.zipcode

    click_on "Create User"

    expect(current_path).to eq(users_path)
    expect(page).to have_content("Error: Missing required information")
  end

  it "can navigate to login path and not show flash message or redirect" do
    visit login_path

    expect(current_path).to eq(login_path)
    expect(current_path).to_not eq(profile_path)
    expect(current_path).to_not eq(dashboard_path)
    expect(current_path).to_not eq(root_path)
    expect(page).to_not have_content("You are already logged in!")

  end
end
