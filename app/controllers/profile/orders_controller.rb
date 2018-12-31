class Profile::OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.create(user: current_user)
    @order.add_cart_items(@cart.contents)
    redirect_to profile_orders_path
    flash[:success] = "Your order was created successfully"
  end
end
