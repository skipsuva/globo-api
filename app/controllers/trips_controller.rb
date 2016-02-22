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

  def update
    trip = Trip.find(params[:id])
    trip.update(trip_params)
    head 204
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :user_id, :start_date, :end_date)
  end
end
