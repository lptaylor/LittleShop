class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def destroy
    @order = Order.find(params[:id])
    @order.order_status = "cancelled"
    @order.add_back_inventory
    @order.save
    flash[:success] = 'users order was successfully cancelled'
    redirect_to admin_user_path(current_user)
  end
end
