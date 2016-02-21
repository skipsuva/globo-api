class TripsController < ApplicationController
  def index
    # loads only those trips of the authenticated user
    trips = authenticate!.trips
    render json: trips
  end

  def show
    render json: Trip.find(params[:id])
  end
end
