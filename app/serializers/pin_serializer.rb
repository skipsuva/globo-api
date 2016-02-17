class PinSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :start_date, :description, :user_id, :place_id
end
