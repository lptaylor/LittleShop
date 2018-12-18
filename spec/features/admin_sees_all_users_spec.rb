require 'rails_helper'

describe 'as an Admin' do
  it 'allows admin to see all users' do
    admin = create(:user, role: 2)
    user_1 = create(:user)
    user_2 = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path

    expect(page).to have_content('All Users')
    expect(page).to have_content(user_1.email)
    expect(page).to have_content(user_1.created_at)
    expect(page).to have_content(user_2.email)
    expect(page).to have_content(user_2.created_at)
  end
end
