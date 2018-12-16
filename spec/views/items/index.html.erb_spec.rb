require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        :item_name => "Item Name",
        :image => "Image",
        :qty_in_stock => 2,
        :price => 3,
        :description => "Description"
      ),
      Item.create!(
        :item_name => "Item Name",
        :image => "Image",
        :qty_in_stock => 2,
        :price => 3,
        :description => "Description"
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td", :text => "Item Name".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
