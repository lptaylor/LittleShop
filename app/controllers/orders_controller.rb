class OrdersController < ApplicationController
  # before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    user_id = session[:user_id]
    @order = Order.new(user_id: user_id)
    @order.items += @contents

  end

end
