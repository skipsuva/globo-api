class DestinationsController < ApplicationController
  def index
    render json: Destination.ordered
  end

  def show
    render json: Destination.find(params[:id])
  end

  def create
    destination = Destination.new(destination_params)
    destinations = destination.trip.destinations
    if destinations.empty?
      destination.first = true
    else
      destination.append_to(destinations.last)
    end
    destination.save
    render json: destination
  end

  def destroy
    destination = Destination.find(params[:id])
    destination.destroy
    head 204
  end

  def update
    update_params = destination_params
    update_params.merge!(params.require(:destination).permit(:pending_operation))
    destination = Destination.find(params[:id])
    case update_params[:pending_operation]
    when "later"
      destination.move_later
    when "earlier"
      destination.move_earlier
    end
    destination.save
    head 204
  end

  private

  def destination_params
    params.require(:destination).permit(:trip_id, :pin_id)
  end

end
