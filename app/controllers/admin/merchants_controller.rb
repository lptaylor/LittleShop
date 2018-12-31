class Admin::MerchantsController < ApplicationController
  def show
    @merchant = User.find(params[:id])
  end

  def update
    @merchant = User.find(params[:id])

    if params[:downgrade]
      @merchant.downgrade_to_user
      flash[:success] = "Downgrade to User Successful"
      redirect_to admin_user_path(@merchant.id)
      return
    end
  end
end
