class Admin::MerchantsController < ApplicationController
  def show
    @merchant = User.merchant.find(params[:id])
  end

  def index
    @merchants = User.merchant
  end

  def update
    @merchant = User.merchant.find(params[:id])

    if params[:downgrade]
      @merchant.downgrade_to_user
      flash[:success] = "Downgrade to User Successful"
      redirect_to admin_user_path(@merchant.id)
      return
    end

    if @merchant.active == false
      @merchant.enable
      redirect_to admin_merchants_path
      flash[:notice] = "#{@merchant.name}'s account is now enabled"
    else
      @merchant.disable
      redirect_to admin_merchants_path
      flash[:notice] = "#{@merchant.name}'s account is now disabled"
    end
  end
end
