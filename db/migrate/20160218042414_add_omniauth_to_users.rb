class AddOmniauthToUsers < ActiveRecord::Migration
  def change
    def change
      add_column :users, :provider, :string
      add_column :users, :uid, :string
    end
  end
end
