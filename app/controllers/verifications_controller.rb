class VerificationsController < ApplicationController
  require 'nokogiri'
  require 'HTTParty'

  def verify(website)
    @website = website.id
    response = HTTParty.get(website.url)
    doc = Nokogiri::HTML(response)
    # use snippet below to find key
    # TODO key = doc.xpath("//meta[@name='blocmetrics']").last['content']
    # TODO if key == website.verification_token website.verified = true
  end
end
