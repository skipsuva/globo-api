class PinsController < ApplicationController

  def index
    # loads only those pins of the authenticated user
    pins = authenticate!.pins.includes(:place)
    render json: pins
  end

  def show
    render json: Pin.find(params[:id])
  end

  def create
    pin = Pin.create_with_place(pin_params)
    pin.user = authenticate!
    pin.save
    render json: pin
  end

# PATCH
  def update
    pin = Pin.find(params[:id])
    # binding.pry
    pin.update(nickname: params[:pin][:nickname], description: params[:pin][:description], start_date: params[:pin][:start_date], visited: params[:pin][:visited])
    head 204

  end

  def destroy
    pin = Pin.find(params[:id])
    pin.destroy
    head 204
  end

  private

  def pin_params
    params.require(:pin).permit(:nickname,:description,:lat,:long,:visited)
  end

end
