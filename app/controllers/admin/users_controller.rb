class Admin::UsersController < ApplicationController

  def index
    @users = User.registered_users
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if params[:upgrade]
      @user.upgrade_to_merchant
      flash[:success] = "Upgrade to Merchant Successful"
      redirect_to admin_merchant_path
      return
    end

    if @user.active == false
      @user.enable
      redirect_to admin_users_path
      flash[:notice] = "#{@user.name}'s account is now enabled"
    else
      @user.disable
      redirect_to admin_users_path
      flash[:notice] = "#{@user.name}'s account is now disabled"
    end
  end

private

  def update_user_params
    params.require(:user).permit(:active)
  end
end
