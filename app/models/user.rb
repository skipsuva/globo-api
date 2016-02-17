class User < ActiveRecord::Base
  has_many :trips, dependent: :destroy
  has_many :pins, dependent: :destroy
end
