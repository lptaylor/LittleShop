class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
    @items = Item.where(id: @cart.contents.keys)
    @cart_total = @cart.contents.map do |item_id, quantity|
      Item.find(item_id).price * quantity
    end.sum
  end

  def create
    item = Item.find(params[:item_id])

    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    count = @cart.count_of(item.id)

    redirect_to items_path
    flash[:success] = "You now have #{pluralize(count, "item")} in your shopping cart"
  end

  def add_item
    item = Item.find(params[:id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    redirect_to cart_path
  end

  def minus_item
    item = Item.find(params[:id])
    @cart.subtract_item(item.id)
    session[:cart] = @cart.contents
    redirect_to cart_path
  end

  def destroy
    if params[:item_id]
      item = Item.find(params[:item_id])
      @cart.remove_item(item.id)
      redirect_to cart_path
    else
      session[:cart] = nil
      redirect_to cart_path
    end
  end
end
