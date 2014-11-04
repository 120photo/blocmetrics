class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :propert1
      t.string :value1
      t.string :property2
      t.string :value2
      t.references :user, index: true
      t.references :website, index: true

      t.timestamps
    end
  end
end
