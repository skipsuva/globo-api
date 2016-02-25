class ChangePinBoolean < ActiveRecord::Migration
  def change
    change_column :pins, :visited, :boolean, default: true
  end
end
