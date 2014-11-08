class VerificationController < ApplicationController
  require 'nokogiri'
  require 'HTTParty'

  def update
    @website = Website.find(params[:id])
    verify_ownership(@website)
    redirect_to @website
  end

  def verify_ownership(website)
    # website = Website.find(params[:id])
    website.verified = true
    website.save
  end

  private

  def verify(website)
    @website = website.id
    response = HTTParty.get(website.url)
    doc = Nokogiri::HTML(response)
    # use snippet below to find key
    key = doc.xpath("//meta[@name='blocmetrics']").last['content']
    if key == @website.verification_token
      @website.verified = true
      @website.save
    end
  end

end
