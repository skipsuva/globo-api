class RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate!
  respond_to :html, :json

  def create
    user = User.create(user_params)
    if user.save
      user.save
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
