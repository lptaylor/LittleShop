require 'rails_helper'

describe 'as an Admin' do
  before(:each) do
    @admin = create(:user, role: 2)

    visit root_path
    click_link "Login"

    fill_in :email, with: @admin.email
    fill_in :password, with: @admin.password

    click_button "Login"
  end

  it 'is redirected to root path after login with flash message' do
    expect(current_path).to eq(root_path)
    expect(page).to have_content("You are logged in!")
  end

  it 'login screen redirects you to root path with flash message' do
    visit login_path

    expect(current_path).to eq(root_path)
    expect(page).to have_content("You are already logged in!")
  end

  it 'does not display shopping cart or number of items ' do
    expect(page).to_not have_link("Shopping Cart")
    expect(page).to_not have_link("My Dashboard")
  end
  it 'has link to see all users' do

    click_link "All Users"

    expect(current_path).to eq(admin_users_path)
  end
end
