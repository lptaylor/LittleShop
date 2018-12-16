require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
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

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

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
