class AddAuthToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
    add_column :users, :authentication_token, :string, index: true
    change_column :users, :email, :string, index: true
  end
end
