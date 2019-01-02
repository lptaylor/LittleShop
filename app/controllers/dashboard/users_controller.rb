class Dashboard::UsersController < ApplicationController
  before_action :require_merchant || :require_admin

  def show
    @pending_orders = Order.pending_orders(current_user.id)
  end
end
