class Destination < ActiveRecord::Base
  belongs_to :trip
  belongs_to :pin
end
