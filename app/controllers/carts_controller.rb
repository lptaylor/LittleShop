class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def show
  end

  def create
    item = Item.find(params[:item_id])

    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    count = @cart.count_of(item.id)

    redirect_to items_path
    flash[:success] = "You now have #{pluralize(count, "item")} in your shopping cart"
  end
end
