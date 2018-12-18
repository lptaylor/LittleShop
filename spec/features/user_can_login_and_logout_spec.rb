require 'rails_helper'

describe 'As a Visitor' do
  it 'can login as a user' do
    # user = User.create(username: "Jeff", address: "123 AbC St", city: "Denver", state: "Colorado", zipcode: 80128, email: "jeff@aol.com", password: "dogsaregreat", role: 0)
    user = create(:user)
    
    visit root_path

    click_link "Login"

    expect(current_path).to eq(login_path)
    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_button "Login"

    expect(current_path).to eq(profile_path)
    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to_not have_link("Login")
  end

  it 'can logout as a user' do
    user = User.create(username: "Jeff", address: "123 AbC St", city: "Denver", state: "Colorado", zipcode: 80128, email: "jeff@aol.com", password: "dogsaregreat", role: 0)

    visit root_path

    click_link "Login"

    expect(current_path).to eq(login_path)
    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_button "Login"

    expect(current_path).to eq(profile_path)
    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to_not have_link("Login")
    expect(page).to have_link("Logout")

    click_link "Logout"

    expect(current_path).to eq(root_path)

  end
end
