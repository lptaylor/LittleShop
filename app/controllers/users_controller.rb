class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def index
    @mechants = User.active_merchants
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
    elsif user_params[:email] == User.existing_email(user_params)
      flash[:alert] = "Alert: Email is already in use"
      render :new
    else
      flash[:error] = "Error: Missing required information"
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.role == "admin"
      @user = User.find(params[:id])
      @user.update(user_params)
      flash[:success] = "#{@user.name}'s information has been updated."
      redirect_to admin_user_path(@user)
    else
      current_user.update(user_params)
      flash[:success] = "Your information has been updated."
      redirect_to profile_path
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :address, :city, :state, :zipcode, :email, :password, :password_confirmation)
    end
end
