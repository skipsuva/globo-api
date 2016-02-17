class Pin < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  has_many :destinations
  has_many :trips, through: :destinations
end
