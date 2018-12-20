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

  it 'is redirected to dashboard after login' do
    expect(current_path).to eq(dashboard_path)
  end

  it 'does not display shopping cart or number of items ' do
    expect(page).to_not have_link("Shopping Cart")
    # expect(page).to_not have_content("Item Count")
  end
end
