class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.datetime :start_date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
