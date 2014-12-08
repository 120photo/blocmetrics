class RemovePropert1FromEvent < ActiveRecord::Migration
  def change
    remove_column :events, :propert1, :string
  end
end
