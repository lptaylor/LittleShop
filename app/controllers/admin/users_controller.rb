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

end
