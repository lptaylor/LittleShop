require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :order_status => "Order Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Order Status/)
  end
end
