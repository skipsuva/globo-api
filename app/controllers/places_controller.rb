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

  def find
    query = params[:search]
    coords = Geocoder.coordinates(query)
    address = Geocoder.address(query)
    render json: Place.new(name: address, lat: coords[0], long: coords[1])
  end
end
