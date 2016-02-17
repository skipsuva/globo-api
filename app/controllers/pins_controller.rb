class PinsController < ApplicationController

  def index
    render json: Pin.all
  end

  def show
    render json: Pin.find(params[:id])
  end
end
