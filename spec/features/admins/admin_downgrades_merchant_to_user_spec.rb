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
  it 'can downgrade a merchant to be a registered_user' do
    merchant = create(:user, role: 1)

    visit admin_merchant_path(merchant.id)

    expect(page).to have_link("Downgrade to User")

    click_link "Downgrade to User"

    expect(current_path).to eq(admin_user_path(merchant.id))
    expect(page).to have_content("Downgrade to User Successful")
    expect(merchant.reload.role).to eq("registered_user")

    expect(current_path).to_not eq(admin_merchant_path(merchant.id))
    expect(merchant.reload.role).to_not eq("merchant")
  end
end
