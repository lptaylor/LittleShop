class OrdersController < ApplicationController
  # before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    user_id = session[:user_id]
    @order = Order.new(user_id: user_id)
    @order.items += @contents
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    flash[:success] = 'Order was successfully destroyed'
    redirect_to profile_path(current_user)
  end

  # # GET /orders/new
  # def new
  #   @order = Order.new
  # end
  #
  # # GET /orders/1/edit
  # def edit
  # end
  #
  # POST /orders
  # POST /orders.json
  # def create
  #   @order = Order.new(order_params)
  #
  #   respond_to do |format|
  #     if @order.save
  #       format.html { redirect_to @order, notice: 'Order was successfully created.' }
  #       format.json { render :show, status: :created, location: @order }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @order.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  # def update
  #   respond_to do |format|
  #     if @order.update(order_params)
  #       format.html { redirect_to @order, notice: 'Order was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @order }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @order.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
end
