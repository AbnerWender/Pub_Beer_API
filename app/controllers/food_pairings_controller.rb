class FoodPairingsController < ApplicationController
  def index
    @food_pairings = FoodPairing.all
    render json: @food_pairings
  end

  def show
    @food_pairing = FoodPairing.find(params[:id])
    render json: @food_pairing
  end

  def create
    @food_pairing = FoodPairing.new(food_pairing_params)
    if @food_pairing.save
      render json: @food_pairing, status: :created
    else
      render json: @food_pairing.errors, status: :unprocessable_entity
    end
  end

  def update
    @food_pairing = FoodPairing.find(params[:id])
    if @food_pairing.update(food_pairing_params)
      render json: @food_pairing
    else
      render json: @food_pairing.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @food_pairing = FoodPairing.find(params[:id])
    @food_pairing.destroy
    head :no_content
  end

  private

  def food_pairing_params
    params.require(:food_pairing).permit(:description, :beer_id)
  end