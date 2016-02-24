class AddColorToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :color, :integer
  end
end
