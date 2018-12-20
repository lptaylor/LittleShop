class SessionsController < ApplicationController
  def new
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
