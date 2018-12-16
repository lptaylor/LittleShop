require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        :order_status => "Order Status"
      ),
      Order.create!(
        :order_status => "Order Status"
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => "Order Status".to_s, :count => 2
  end
end
