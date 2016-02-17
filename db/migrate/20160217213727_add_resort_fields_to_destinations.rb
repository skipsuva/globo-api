# Migration to add the necessary fields to a resorted model
class AddResortFieldsToDestinations < ActiveRecord::Migration
  # Adds Resort fields, next_id and first, and indexes to a given model
  def self.up
    add_column :destinations, :next_id, :integer
    add_column :destinations, :first,   :boolean
    add_index :destinations, :next_id
    add_index :destinations, :first
  end

  # Removes Resort fields
  def self.down
    remove_column :destinations, :next_id
    remove_column :destinations, :first
  end
end

