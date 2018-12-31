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

      @joe = create(:user)
      @bob = create(:user)
      @tom = create(:user)
      @sally = create(:user, active: false)

      visit root_path
      click_link "Login"

      fill_in :email, with: @admin_1.email
      fill_in :password, with: @admin_1.password

      click_button "Login"
    end
    it 'can disable a registered user' do
      visit admin_users_path

      within "#user-#{@joe.id}" do
        click_on "disable"
      end

      expect(current_path).to eq(admin_users_path)
      expect(page).to have_content("#{@joe.name}'s account is now disabled")

      within "#user-#{@joe.id}" do

        expect(page).to have_button("enable")
      end
      expect(@joe.reload.active).to be false
    end

      it 'can enable a registered user' do
        visit admin_users_path

        within "#user-#{@sally.id}" do
          click_on "enable"
        end

        expect(current_path).to eq(admin_users_path)
        expect(page).to have_content("#{@sally.name}'s account is now enabled")

        within "#user-#{@sally.id}" do
          expect(page).to have_button("disable")
        end

        expect(@sally.reload.active).to be true
      end
  end
end
