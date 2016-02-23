class Place < ActiveRecord::Base
  # geocoded_by :address, :latitude  => :lat, :longitude => :long
  reverse_geocoded_by :lat, :long, address: :address

  has_many :pins

end
