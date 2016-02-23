class Place < ActiveRecord::Base
  # geocoded_by :address, :latitude  => :lat, :longitude => :long
  reverse_geocode_by :lat, :long, address: :address

  has_many :pins

end
