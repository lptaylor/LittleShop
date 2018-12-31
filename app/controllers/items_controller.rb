class ItemsController < ApplicationController

  def index
    @items = Item.all
    @top_items = Item.popular_items("desc")
    @bottom_items = Item.popular_items("asc")
  end

  def show
    @item = Item.find(params[:id])
  end

end
