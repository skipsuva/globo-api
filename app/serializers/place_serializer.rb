class PlaceSerializer < ActiveModel::Serializer
  # embed :ids, include: true
  attributes :id, :name, :lat, :long, :address
  has_many :pins
end
