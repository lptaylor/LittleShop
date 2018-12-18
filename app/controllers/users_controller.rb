class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to profile_path
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:address, :city, :state, :zipcode, :email, :password, :role)
    end
end
