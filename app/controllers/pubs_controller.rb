class PubsController < ApplicationController
  def index
    @pubs = Pub.all
    render json: @pubs
  end

  def show
    @pub = Pub.find(params[:id])
    render json: @pub
  end

  def create
    @pub = Pub.new(pub_params)
    if @pub.save
      render json: @pub, status: :created
    else
      render json: @pub.errors, status: :unprocessable_entity
    end
  end

  def update
    @pub = Pub.find(params[:id])
    if @pub.update(pub_params)
      render json: @pub
    else
      render json: @pub.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @pub = Pub.find(params[:id])
    @pub.destroy
    head :no_content
  end

  private

  def pub_params
    params.require(:pub).permit(:name, :location)
  end
end