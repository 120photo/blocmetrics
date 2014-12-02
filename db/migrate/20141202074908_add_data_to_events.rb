class AddDataToEvents < ActiveRecord::Migration
  def change
    add_column :events, :data, :string
  end
end
