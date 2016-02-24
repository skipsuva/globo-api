class TripSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :name, :start_date, :user_id, :color
end
