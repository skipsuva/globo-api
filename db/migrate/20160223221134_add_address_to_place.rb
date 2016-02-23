class AddAddressToPlace < ActiveRecord::Migration
  def change
    add_column :places, :address, :string
    remove_column :pins, :address
  end
end
