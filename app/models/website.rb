class Website < ActiveRecord::Base
  belongs_to :user
  has_many :events
  before_create :does_site_exist

  # check if site already exists
  def does_site_exist
    Website.where(url: self.url).where(verified: true).exists?
  end

end
