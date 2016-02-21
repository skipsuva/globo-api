class PinsController < ApplicationController

  def index
    # binding.pry
    render json: current_user.pins
  end

  def show
    render json: Pin.find(params[:id])
  end

  def create
    Pin.create_with_place(pin_params)
  end

  def destroy
    pin = Pin.find(params[:id])
    pin.destroy
  end

  private

  def pin_params
    params.require(:pin).permit(:nickname,:description,:lat,:long)
  end

end
