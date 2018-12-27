class Dashboard::ItemsController < ApplicationController

  def index
    current_merchant
  end

  def toggle_active(item)
    toggle_active(item)
    redirect dashboard_items_path
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to dashboard_items_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      @item.save
    else
      render :edit
    end
  end

  def toggle_active(toggle_params)
    toggle(:enabled).save
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to dashboard_items_path
  end

  private

  def toggle_params
    params.require(:item).permit(:enabled)
  end

  def item_params
    params.require(:item).permit(:item_name, :image_url, :inventory, :price, :description)
  end
end
