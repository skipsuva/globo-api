class Pin < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  has_many :destinations
  has_many :trips, through: :destinations

  def self.create_by_place(args)

    name = args[:name]
    lat = args[:lat]
    long = args[:long]

    if name
      if coords = Geocoder.coordinates(name)
        place = Place.create(name:name,lat:coords[0], long:coords[1])
      end
    else
      if (lat && long)
        place = Place.create(lat:lat,long:long)
      end
    end

    self.create(nickname:name,place:place)

  end

end
