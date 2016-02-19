class AddVisitedToPins < ActiveRecord::Migration
  def change
    change_table :pins do |t|
      t.boolean :visited
    end
  end
end
