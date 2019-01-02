class Dashboard::ItemsController < ApplicationController

  def index
    current_merchant
  end

  def new
    @item = Item.new
  end

  def create
    @current_merchant = current_merchant
    @item = @current_merchant.items.create(item_params)
    if @item.save
      redirect_to dashboard_items_path
      flash[:success] = "Your Item Has Been Added"
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
      redirect_to dashboard_items_path
      flash[:success] = "Your Item Has Been Edited"
    else
      render :edit
    end
  end

  def toggle_active
    @item = Item.find(params[:id])
    @item.toggle(:enabled).save
    redirect_to dashboard_items_path
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to dashboard_items_path
    flash[:success] = "You have deleted this item."
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :image_url, :inventory, :price, :description)
  end
end
