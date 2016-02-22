class DestinationsController < ApplicationController
  def index
    render json: Destination.all
  end

  def show
    render json: Destination.find(params[:id])
  end

  def create
    destination = Destination.create(destination_params)
    render json: destination
  end

  private

  def destination_params
    params.require(:destination).permit(:trip_id, :pin_id, :user)
  end
end
