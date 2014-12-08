class RemoveProperty1FromEvent < ActiveRecord::Migration
  def change
    remove_column :events, :property1, :string
    remove_column :events, :property2, :string
    remove_column :events, :value1, :string
    remove_column :events, :value2, :string
  end
end
