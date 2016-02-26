class DestinationsController < ApplicationController
  def index
    render json: Destination.ordered
  end

  def show
    render json: Destination.find(params[:id])
  end

  def create
    destination = Destination.create(destination_params)
    render json: destination
  end

  def destroy
    destination = Destination.find(params[:id])
    destination.destroy
    head 204
  end

  def update
    destination = Destination.find(params[:id])
    case destination_params[:pending_operation]
    when "later"
      destination.move_later
    when "ealier"
      destination.move_earlier
    end
    destination.save
    head 204
  end

  private

  def destination_params
    params.require(:destination).permit(:trip_id, :pin_id, :pending_operation)
  end
end
