class ToysController < ApplicationController
  before_action :set_toy, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:seller, :new, :create, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]

  #seller page
  # def seller
  #   @toys = Toy.where(user: current_user)
  # end

  # GET /toys
  def index
    @toys = Toy.all
  end

  # GET /toys/1
  def show; end

  # GET /toys/new
  def new
    @toy = Toy.new
  end

  # GET /toys/1/edit
  def edit; end

  # POST /toys or /toys.json
  def create
    @toy = Toy.new(toy_params)
    @toy.user_id = current_user.id
    if @toy.save
      redirect_to toy_path(@toy)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /toys/1 or /toys/1.json
  def update; end

  # DELETE /toys/1 or /toys/1.json
  def destroy
    @toy = Toy.find(params[:id])
    @toy.destroy
    redirect_to toys_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_toy
    @toy = Toy.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def toy_params
    params.require(:toy).permit(:name, :description, :price, :photo)
  end

  def check_user
    if current_user != @toy.user
      redirect_to root_url, alert: "Sorry, this toy belongs to someone else"
    end
  end
end
