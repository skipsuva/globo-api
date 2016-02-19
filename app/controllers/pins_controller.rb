class PinsController < ApplicationController

  def index
    render json: Pin.all
  end

  def show
    render json: Pin.find(params[:id])
  end

  def create
    pin = Pin.create_with_place(pin_params)
    render json: pin
  end

  def destroy
    pin = Pin.find(params[:id])
    pin.destroy
    head 204
  end

  private

  def pin_params
    params.require(:pin).permit(:nickname,:description,:lat,:long)
  end

end
