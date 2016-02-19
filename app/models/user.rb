class User < ActiveRecord::Base
  has_many :trips, dependent: :destroy
  has_many :pins, dependent: :destroy

  has_secure_password
  before_save :verify_authentication_token


  def verify_authentication_token
    if authentication_token.empty?
      self.authentication_token = generate_auth_token
    end
  end
end
