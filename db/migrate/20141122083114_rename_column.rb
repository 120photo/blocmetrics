class RenameColumn < ActiveRecord::Migration
  def change
      rename_column :events, :propert1, :property1
  end
end
