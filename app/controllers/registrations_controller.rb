class RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate!
  respond_to :html, :json

  def create
    binding.pry
    super do |user|
      if request.format.json?
        data = {
          token: user.authentication_token,
          email: user.email,
          id: user.id
        }
        render json: data, status: 201 and return
      end
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
