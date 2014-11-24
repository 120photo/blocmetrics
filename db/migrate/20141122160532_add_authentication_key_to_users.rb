class AddAuthenticationKeyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :authentication_key, :string
  end
end
