class AddUriToWebsite < ActiveRecord::Migration
  def change
    add_column :websites, :uri, :string
  end
end
