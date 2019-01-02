class Profile::OrdersController < ApplicationController
  before_action :require_registered_user

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.create(user: current_user)
    @order.add_cart_items(@cart.contents)
    session[:cart] = Hash.new(0)
    @order.update_inventory
    redirect_to profile_orders_path
    flash[:success] = "Your order was created successfully"
  end
end
