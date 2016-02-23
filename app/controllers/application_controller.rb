class ApplicationController < ActionController::API
  include ActionController::Serialization
  include ActionController::HttpAuthentication::Token::ControllerMethods
  helper_method :current_user
  before_action :authenticate!

  Geocoder.configure(:timeout => 1000)

  # def current_user
  #   User.find_by(authentication_token: the_auth_token)
  # end

  private

  def authenticate!
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      User.find_by(authentication_token: token)
    end
  end

  # def the_auth_token
  #   authenticate_with_http_token do |token, options|
  #     return token
  #   end
  # end

  def render_unauthorized
    render json: {errors: ['Bad credentials']}, status: 401
  end

end
