class PinSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :nickname, :start_date, :description, :lat, :long, :visited, :address

  def lat
    object.place.lat
  end

  def long
    object.place.long
  end

  def address
    if !object.place.address
      object.place.address = Geocoder.address([object.place.lat, object.place.long])
      object.place.save
    end
    object.place.address
  end
end
