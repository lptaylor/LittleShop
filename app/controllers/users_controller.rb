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
      flash[:success] = "You are now registered & logged in!"
      redirect_to profile_path
    else
      flash[:error] = "Error: Missing required information"
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :address, :city, :state, :zipcode, :email, :password, :role)
    end
end
