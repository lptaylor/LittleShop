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
    
    if @user.active == false
      @user.enable
      flash[:notice] = "#{@user.name}'s account is now enabled"
      redirect_to admin_users_path
    elsif  @user.active == true
      @user.disable
      flash[:notice] = "#{@user.name}'s account is now disabled"
      redirect_to admin_users_path
    end
  end

end
