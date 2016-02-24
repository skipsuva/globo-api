class TripSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :name, :start_date, :user_id, :hex_color

  def hex_color
    object.hex_color
  end
  
end
