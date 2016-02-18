class PinSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :nickname, :start_date, :description, :coords

  def coords
    [object.place.lat, object.place.long]
  end
end
