class Dashboard::UsersController < ApplicationController
  before_action :require_merchant

  def show
    @pending_orders = Order.pending_orders(current_user.id)
  end
end
