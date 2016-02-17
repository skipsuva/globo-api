class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :nickname
      t.datetime :start_date
      t.text :description
      t.references :user, index: true, foreign_key: true
      t.references :place, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
