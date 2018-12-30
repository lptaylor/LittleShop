class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :current_merchant, :current_admin

  before_action :build_cart

  def current_user
    @current_user||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_merchant
    if current_user && current_user.merchant?
      @current_merchant = @current_user
    end
  end

  def current_admin
    if current_user && current_user.admin?
      @current_admin = @current_user
    end
  end

  def build_cart
    @cart ||= Cart.new(session[:cart])
  end
end
