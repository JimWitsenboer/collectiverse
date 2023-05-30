class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # Sales
  def sales
    @orders = Order.all.where(@toy.id == current_user) #how to set this?
    return @orders #add sorting on status pending
  end

  # Purchases
  def purchases
    @orders = Order.all.where(user_id: current_user)
  end

  # GET /orders/new
  def new
    @order = Order.new
    @toy = Toy.find(params[:toy_id])
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)
    @toy = Toy.find(params[:toy_id])
    @order.toy_id = @toy.id
    @order.user_id = current_user.id
    @order.status = "pending"

    if @order.save
      redirect_to toy_path(@toy)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:address, :state, :country)
    end
end
