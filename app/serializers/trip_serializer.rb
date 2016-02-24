class TripSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :name, :start_date, :user_id, :web_color

  def web_color
    object.hex_color
  end

end
