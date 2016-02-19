class PinsController < ApplicationController

  def index
    render json: Pin.all
  end

  def show
    render json: Pin.find(params[:id])
  end

  def create
    binding.pry
    Pin.create(pin_params)
  end

  private

  def pin_params
    params.require(:pin).permit(:nickname,:description)
  end

end
