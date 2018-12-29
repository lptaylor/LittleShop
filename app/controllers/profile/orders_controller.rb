class Profile::OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.create(user: current_user)
    items_with_quantity = {}
    @cart.contents.each do |item_id, qty|
      items_with_quantity[Item.find(item_id)] = qty
    end
    @order.items += items_with_quantity.keys
    order_item = OrderItem.where('order_id=?, @order.id')
    binding.pry
    redirect_to profile_orders_path
    flash[:success] = "Your order was created successfully"
  end

end
