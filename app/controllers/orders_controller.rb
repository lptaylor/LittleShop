class OrdersController < ApplicationController

  def destroy
    @order = Order.find(params[:id])
    @order.order_status = "cancelled"
    @order.add_back_inventory
    @order.save
    flash[:success] = 'Order was successfully cancelled'
    redirect_to profile_path(current_user)
  end

  def create
    @order = Order.create(user: current_user)
    @order.add_cart_items(@cart.contents)
    @order.update_inventory
    redirect_to profile_orders_path
    flash[:success] = "Your order was created successfully"
  end

end
