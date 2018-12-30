require 'rails_helper'

describe 'as an admin' do
  describe "when on the users index page" do
    before(:each) do
      @admin_1 = create(:user, role: 2)
      @admin_2 = create(:user, role: 2)
      @admin_3 = create(:user, role: 2)

      @merchant_1 = create(:user, role: 1)
      @merchant_2 = create(:user, role: 1)
      @merchant_3 = create(:user, role: 1)

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
    it 'can disable a registered user' do
      visit admin_users_path

      within "#user-#{@user_1.id}" do
        click_on "disable"
      end

      expect(current_path).to eq(admin_users_path)
      expect(page).to have_content("#{@user_1.name}'s account is now disabled")

      within "#user-#{@user_1.id}" do
        expect(@user_1.active).to be false
        expect(page).to have_button("enable")
      end
    end

      it 'can enable a registered user' do
        visit admin_users_path

        within "#user-#{@user_4.id}" do
          click_on "enable"
        end

        expect(current_path).to eq(admin_users_path)
        expect(page).to have_content("#{@user_1.name}'s account has now been enabled")

        within "#user-#{@user_4.id}" do
          expect(@user_4.active).to be true
          expect(page).to have_button("disable")
        end
      end
  end
end
