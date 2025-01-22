class BeersController < ApplicationController
  def index
    @beers = Beer.all
    render json: @beers
  end

  def show
    @beer = Beer.find(params[:id])
    render json: @beer
  end

  def create
    @beer = Beer.new(beer_params)
    if @beer.save
      render json: @beer, status: :created
    else
      render json: @beer.errors, status: :unprocessable_entity
    end
  end

  def update
    @beer = Beer.find(params[:id])
    if @beer.update(beer_params)
      render json: @beer
    else
      render json: @beer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @beer = Beer.find(params[:id])
    @beer.destroy
    head :no_content
  end

  private

  def beer_params
    params.require(:beer).permit(:name, :style)
  end
end