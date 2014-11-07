class VerificationsController < ApplicationController
  require 'nokogiri'
  require 'open-uri' # used by nokogiri?
  require 'HTTParty'

  def verify(website)
    @website = website.id
    response = HTTParty.get(website.url)
    doc = Nokogiri::HTML(response)
    # use snippet below to find key
    # TODO key = doc.xpath("//meta[@name='blocmetrics']").last['content']
  end
end
