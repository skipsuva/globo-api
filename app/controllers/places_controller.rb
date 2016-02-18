class PlacesController < ApplicationController
  def index
    render json: Place.all
  end

  def show
    render json: Place.find(params[:id])
  end

  def create
    Place.create(place_params)
  end

  private

  def place_params
    params.require(:place).permit(:name,:lat,:long)
  end

end
