require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :user_name => "MyString",
      :address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zipcode => 1,
      :email => "MyString",
      :password => "MyString",
      :permissions => "MyString"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[user_name]"

      assert_select "input[name=?]", "user[address]"

      assert_select "input[name=?]", "user[city]"

      assert_select "input[name=?]", "user[state]"

      assert_select "input[name=?]", "user[zipcode]"

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[password]"

      assert_select "input[name=?]", "user[permissions]"
    end
  end
end
