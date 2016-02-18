class TripSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_date, :user_id
end
