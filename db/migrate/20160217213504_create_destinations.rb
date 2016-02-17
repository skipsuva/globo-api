class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.references :trip, index: true, foreign_key: true
      t.references :pin, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
