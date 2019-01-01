class Dashboard::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @merchant = current_merchant
    @items = @order.items.where(user_id: @merchant.id)
    @order_items = OrderItem.orders_for_merchant(@order.id, @merchant.id)
  end
end
