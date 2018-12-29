require 'rails_helper'

describe 'as an admin' do
  describe "when clicking the 'merchants' link in the nav bar " do
    before(:each) do
      @admin_1 = create(:user, role: 2)
      @admin_2 = create(:user, role: 2)
      @admin_3 = create(:user, role: 2)

      @merchant_1 = create(:user, role: 1)
      @merchant_2 = create(:user, role: 1)
      @merchant_3 = create(:user, role: 1)
      @merchant_4 = create(:user, role: 1, active: false)

      @user_1 = create(:user)
      @user_2 = create(:user)
      @user_3 = create(:user)
      @user_4 = create(:user, active: false)

      visit root_path
      click_link "Login"

      fill_in :email, with: @admin_1.email
      fill_in :password, with: @admin_1.password

      click_button "Login"
    end
    it 'only shows merchants' do
      enabled = "disable"
      disabled = "enable"

      visit  admin_merchants_path

      expect(current_path).to eq(admin_merchants_path)
      expect(page).to have_content(@merchant_1.name)
      expect(page).to have_content(@merchant_2.name)
      expect(page).to have_content(@merchant_3.name)
      expect(page).to have_content(@merchant_4.name)

      within "#user-#{@merchant_1.id}" do
        expect(page).to have_link(@merchant_1.name)
        expect(page).to have_content(@merchant_1.city)
        expect(page).to have_content(@merchant_1.state)
        expect(page).to have_button(enabled)
        expect(page).to_not have_button(disabled)
        expect(page).to_not have_content(@admin_1.name)
        expect(page).to_not have_content(@admin_2.name)
        expect(page).to_not have_content(@admin_3.name)
        expect(page).to_not have_content(@user_1.name)
        expect(page).to_not have_content(@user_2.name)
        expect(page).to_not have_content(@user_3.name)
        expect(page).to_not have_content(@user_4.name)
      end

      within "#user-#{@merchant_2.id}" do
        expect(page).to have_link(@merchant_2.name)
        expect(page).to have_content(@merchant_2.city)
        expect(page).to have_content(@merchant_2.state)
        expect(page).to have_button(enabled)
        expect(page).to_not have_button(disabled)
      end

      within "#user-#{@merchant_3.id}" do
        expect(page).to have_link(@merchant_3.name)
        expect(page).to have_content(@merchant_3.city)
        expect(page).to have_content(@merchant_3.state)
        expect(page).to have_button(enabled)
        expect(page).to_not have_button(disabled)
      end

      within "#user-#{@merchant_4.id}" do
        expect(page).to have_link(@merchant_4.name)
        expect(page).to have_content(@merchant_4.city)
        expect(page).to have_content(@merchant_4.state)
        expect(page).to have_button(disabled)
        expect(page).to_not have_button(enabled)
      end
    end
  end
end
