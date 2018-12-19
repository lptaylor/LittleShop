require 'rails_helper'

describe 'As a user' do
  before(:each) do
    @user = create(:user)

    visit root_path
    click_link "Login"

    fill_in :email, with: @user.email
    fill_in :password, with: @user.password

    click_button "Login"
  end

  it 'Can navigate to see orders' do

    expect(page).to have_link("My Orders")

    click_link "My Orders"

    expect(current_path).to eq(profile_orders_path)
  end

  it 'Can navigate to profile page' do

    click_link "My Orders"

    expect(current_path).to eq(profile_orders_path)

    click_link "My Profile"

    expect(current_path).to eq(profile_path)
  end
end
