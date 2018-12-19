require 'rails_helper'

describe 'As a user' do
  before(:each) do
    @user = create(:user)

    visit root_path
    click_link "Login"

    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_button "Login"
  end

  describe 'When logged in' do
    it 'Can navigate to see orders' do

      click_link "My Orders"

      expect(current_path).to eq(user_order_path)
    end
  end
end
