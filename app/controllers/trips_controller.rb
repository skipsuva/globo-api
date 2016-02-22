class TripsController < ApplicationController
  def index
    # loads only those trips of the authenticated user
    trips = authenticate!.trips
    render json: trips
  end

  def show
    render json: Trip.find(params[:id])
  end

  def create
    trip = Trip.create(trip_params)
    trip.user = authenticate!
    trip.save
    render json: trip
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :user_id, :user)
  end
end
