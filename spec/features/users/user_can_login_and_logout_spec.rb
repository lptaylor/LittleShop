require 'rails_helper'

describe 'As a User' do
  it 'can login as a user' do
    user = create(:user)

    visit root_path
    click_link "Login"

    expect(current_path).to eq(login_path)

    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_button "Login"

    expect(current_path).to eq(profile_path)
    expect(page).to have_content("Welcome, #{user.email}")
    expect(page).to_not have_link("Login")
  end

  it 'can logout as a user' do
    user = create(:user)

    visit root_path
    click_link "Login"

    expect(current_path).to eq(login_path)

    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_button "Login"

    expect(current_path).to eq(profile_path)
    expect(page).to have_content("Welcome, #{user.email}")
    expect(page).to_not have_link("Login")
    expect(page).to have_link("Logout")

    click_link "Logout"

    expect(current_path).to eq(root_path)
  end

  it 'will not allow the user to login with invalid credentials' do
    user = create(:user)

    visit root_path
    click_link "Login"

    fill_in :email, with: user.email
    fill_in :password, with: "Hotdog"

    click_button "Login"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Your username or password is incorrect")
  end

  it 'redirects to the appropriate page for registered_user' do
    user = create(:user)

    visit root_path
    click_link "Login"

    expect(current_path).to eq(login_path)

    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_button "Login"
    expect(current_path).to eq(profile_path)
    expect(page).to have_content("You are logged in!")
  end

  it 'redirects to the appropriate page for merchant' do
    merchant = create(:user, role: 1)

    visit root_path
    click_link "Login"

    expect(current_path).to eq(login_path)

    fill_in :email, with: merchant.email
    fill_in :password, with: merchant.password

    click_button "Login"
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("You are logged in!")
  end

  it 'redirects to the appropriate page for admin' do
    admin = create(:user, role: 2)

    visit root_path
    click_link "Login"

    expect(current_path).to eq(login_path)

    fill_in :email, with: admin.email
    fill_in :password, with: admin.password

    click_button "Login"
    expect(current_path).to eq(root_path)
    expect(page).to have_content("You are logged in!")
  end
end
