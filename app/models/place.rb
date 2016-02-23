class Place < ActiveRecord::Base
  # geocoded_by :address, :latitude  => :lat, :longitude => :long

  has_many :pins

end
