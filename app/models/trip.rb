class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :destinations, dependent: :destroy
  has_many :pins, through: :destinations
end
