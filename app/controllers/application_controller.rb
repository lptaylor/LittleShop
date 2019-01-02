class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :current_merchant, :current_admin, :guest

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

  def current_registered_user?
    current_user && current_user.registered_user?
  end

  def current_merchant?
    current_user && current_user.merchant?
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def guest
    current_user.nil?
  end

  def cart_access
    current_registered_user? || guest
  end

  def require_admin
    render file: "/public/404" unless current_admin?
  end

  def require_merchant
    render file: "/public/404" unless current_merchant?
  end

  def require_registered_user
    render file: "/public/404" unless current_registered_user?
  end

  def authorization
    render './public/404.html'
  end

  def build_cart
    @cart ||= Cart.new(session[:cart])
  end
end
