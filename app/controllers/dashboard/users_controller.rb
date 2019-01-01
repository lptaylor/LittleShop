class Dashboard::UsersController < ApplicationController
  def show
    @pending_orders = Order.pending_orders(current_user.id)
  end
end
