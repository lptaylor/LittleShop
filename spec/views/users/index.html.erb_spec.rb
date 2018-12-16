require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :user_name => "User Name",
        :address => "Address",
        :city => "City",
        :state => "State",
        :zipcode => 2,
        :email => "Email",
        :password => "Password",
        :permissions => "Permissions"
      ),
      User.create!(
        :user_name => "User Name",
        :address => "Address",
        :city => "City",
        :state => "State",
        :zipcode => 2,
        :email => "Email",
        :password => "Password",
        :permissions => "Permissions"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "User Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "Permissions".to_s, :count => 2
  end
end
