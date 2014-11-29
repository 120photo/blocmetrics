class AutoVerifySites
  include Sidekiq::Worker

  def perform(website_id)
    @website = Website.find(website_id)
    @website.verify!
  end
end
