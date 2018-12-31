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
  it 'can upgrade a registered_user to be a merchant' do
    user = create(:user)

    visit admin_user_path(user.id)

    expect(page).to have_link("Upgrade to Merchant")

    click_link "Upgrade to Merchant"

    expect(current_path).to eq(admin_merchant_path(user.id))
    expect(page).to have_content("Upgrade to Merchant Successful")
    expect(user.reload.role).to eq("merchant")

    expect(current_path).to_not eq(admin_user_path(user.id))
    expect(user.reload.role).to_not eq("registered_user")
  end
end
