class UsersController < ApplicationController

  def index
    user = authenticate!
    render json: user
  end

  def show
    render json: User.find(params[:id])
  end
  
end
