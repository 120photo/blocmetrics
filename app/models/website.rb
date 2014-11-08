class Website < ActiveRecord::Base
  belongs_to :user
  has_many :events
  # before_create :does_site_exist
  # TODO seeds fail if does_site_exist is called with before_create when there is no initial site record, must be commented out for seeds to work, fix this...

  # check if site already exists
  def does_site_exist
    Website.where(url: self.url).where(verified: true).exists?
  end

end
