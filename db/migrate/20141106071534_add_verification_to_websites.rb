class AddVerificationToWebsites < ActiveRecord::Migration
  def change
    add_column :websites, :verification_token, :string
    add_column :websites, :verified, :boolean, default: false
  end
end
