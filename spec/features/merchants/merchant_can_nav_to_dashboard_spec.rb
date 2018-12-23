require 'rails_helper'

describe 'As a Merchant' do
  before(:each) do
    @merchant = create(:user, role: 1)

    visit root_path
    click_link "Login"

    fill_in :email, with: @merchant.email
    fill_in :password, with: @merchant.password

    click_button "Login"
  end

  it 'is redirected to dashboard after login with flash message' do
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("You are logged in!")
  end

  it 'login screen redirects you to dashboard with flash message' do
    visit login_path

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("You are already logged in!")
  end

  it 'does not display shopping cart or number of items ' do
    expect(page).to_not have_link("Shopping Cart")
    # expect(page).to_not have_content("Item Count")
  end

  it 'shows merchant profile information without edit button' do
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content(@merchant.name)
    expect(page).to have_content(@merchant.email)
    expect(page).to have_content(@merchant.city)
    expect(page).to have_content(@merchant.state)
    expect(page).to have_content(@merchant.zipcode)

    expect(page).to_not have_link("Edit")
  end
end
