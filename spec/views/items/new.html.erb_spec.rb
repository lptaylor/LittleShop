require 'rails_helper'

RSpec.describe "items/new", type: :view do
  before(:each) do
    assign(:item, Item.new(
      :item_name => "MyString",
      :image => "MyString",
      :qty_in_stock => 1,
      :price => 1,
      :description => "MyString"
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "input[name=?]", "item[item_name]"

      assert_select "input[name=?]", "item[image]"

      assert_select "input[name=?]", "item[qty_in_stock]"

      assert_select "input[name=?]", "item[price]"

      assert_select "input[name=?]", "item[description]"
    end
  end
end
