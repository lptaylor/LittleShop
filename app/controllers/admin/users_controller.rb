class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user[:role] = "merchant"

    if @user.role == "merchant"
    flash[:success] = "Upgrade to Merchant Successful"
    redirect_to admin_merchant_path
    else
      flash[:success] = "Upgrade failed"
      redirect_to admin_user_path
    end
  end
end
