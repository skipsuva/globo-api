class PlacesController < ApplicationController
  def index
    pins = authenticate!.pins
    places = []
    pins.each {|pin| places << pin.place}
    # places = Place.all.where
    render json: places
  end

  def show
    render json: Place.find(params[:id])
  end
end
