class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # All sales in a list
  # Only the pending sales on the map
  # Sales
  def sales
    @orders = Order.joins(:toy).where(toys: { user: current_user }) #how to set this?
    @pending_sales = @orders.where(status: "pending").or(@orders.where(status: "approved"))
    @markers = @pending_sales.geocoded.map do |order|
      {
        lat: order.latitude,
        lng: order.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { order: order }),
        marker_html: render_to_string(partial: "marker", locals: {order: order})
      }
    end
  end

  # Purchases
  def purchases
    @orders = Order.where(user_id: current_user.id)
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
      redirect_to purchases_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    order = Order.find(params[:id])
    order.status = params[:status]
    order.save
    redirect_to sales_path
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
