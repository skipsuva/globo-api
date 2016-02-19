class PinSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :nickname, :start_date, :description, :lat, :long

  def lat
    object.place.lat
  end

  def long
    object.place.long
  end
end
