class SessionsController < ApplicationController
  def new
    flash_message = flash[:alert] = "You are already logged in!"

    if current_user
      if current_user.role == 'registered_user'
        redirect_to profile_path
        flash_message
      elsif current_user.role == 'merchant'
        redirect_to dashboard_path
        flash_message
      else current_user.role == 'admin'
        redirect_to root_path
        flash_message
      end
    else
      render :new
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.role == 'registered_user'
        redirect_to profile_path
        flash[:success] = "You are logged in!"
      elsif user.role == 'merchant'
        redirect_to dashboard_path
        flash[:success] = "You are logged in!"
      else user.role == 'admin'
        redirect_to root_path
        flash[:success] = "You are logged in!"
      end
    else
      flash[:error] = "Your username or password is incorrect"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
