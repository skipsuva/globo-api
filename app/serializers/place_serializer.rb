class PlaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :lat, :long
end
