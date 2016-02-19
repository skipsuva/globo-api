class PinsController < ApplicationController

  def index
    render json: Pin.all
  end

  def show
    render json: Pin.find(params[:id])
  end

  def create
    Pin.create_by_place(pin_params)
  end

  private

  def pin_params
    params.require(:pin).permit(:nickname,:description,:lat,:long)
  end

end
