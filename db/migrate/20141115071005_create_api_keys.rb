class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :access_token
      t.boolean :valid, default: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
