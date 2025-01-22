class CoverageController < ApplicationController
  def index
    @coverages = Coverage.all
    render json: @coverages
  end
end
