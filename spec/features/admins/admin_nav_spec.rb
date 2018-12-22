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

  it 'is redirected to root path after login' do
    expect(current_path).to eq(root_path)
  end

  it 'does not display shopping cart or number of items ' do
    expect(page).to_not have_link("Shopping Cart")
    expect(page).to_not have_link("My Dashboard")
  end
  it 'has link to see all users' do

    click_link "All Users"

    expect(current_path).to eq(admin_users_path)
  end

  it 'can see a registered_users profile page' do
      user = create(:user)

      visit admin_user_path(user.id)

      expect(page).to have_content("Name: #{user.name}")
      expect(page).to have_content("Email: #{user.email}")
      expect(page).to have_content("Address: #{user.address}")
      expect(page).to have_content("City: #{user.city}")
      expect(page).to have_content("State: #{user.state}")
      expect(page).to have_content("Zipcode: #{user.zipcode}")
      expect(page).to_not have_content(user.password)
      expect(page).to have_link("Edit Profile")

      expect(page).to_not have_content("Name: #{@admin.name}")
      expect(page).to_not have_content("Email: #{@admin.email}")
      expect(page).to_not have_content("Address: #{@admin.address}")
      expect(page).to_not have_content("City: #{@admin.city}")
      expect(page).to_not have_content("State: #{@admin.state}")
      expect(page).to_not have_content("Zipcode: #{@admin.zipcode}")
      expect(page).to_not have_content(@admin.password)
  end
end
