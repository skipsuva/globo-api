class Pin < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  has_many :destinations, dependent: :destroy
  has_many :trips, through: :destinations

  def self.create_with_place(args)

    description = args[:description]
    name = args[:nickname]
    lat = args[:lat]
    long = args[:long]

    if name
      if coords = Geocoder.coordinates(name)
        place = Place.create(name:name,lat:coords[0], long:coords[1])
      end
    else
      if (lat && long)
        place = Place.create(lat:lat,long:long)
        result = Geocoder.search("#{lat},#{long}")
        place_name = result[0].try(:data).try("[]","address_components").try(:find){|h| h["types"].try(:include?,"locality")}.try("[]","long_name")
        place_name = result[0].try(:data).try("[]","address_components").try(:find){|h| h["types"].try(:include?,"political")}.try("[]","long_name") if !place_name
        place.name = place_name
        name = place_name
        place.save
      end
    end

    self.create(nickname:name,description:description,place:place)

  end

end
