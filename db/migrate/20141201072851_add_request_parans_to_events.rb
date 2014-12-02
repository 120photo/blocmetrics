class AddRequestParansToEvents < ActiveRecord::Migration
  def change
    add_column :events, :ip, :string
    add_column :events, :host, :string
    add_column :events, :agent, :string
    add_column :events, :uri, :string
  end
end
