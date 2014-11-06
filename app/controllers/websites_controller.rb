class WebsitesController < ApplicationController
  before_filter :authenticate_user!
  require 'SecureRandom'

  def index
    @websites = current_user.websites.all
  end

  def new
  end

  def show
  end

  def edit
  end

  def create
    @site = Website.new(params.require(:website).permit(:name, :url))
    @site.user = current_user
    @site.verification_token = SecureRandom.hex(12)
    @site.save
    redirect_to websites_url
  end

  def destroy
  end

  def update
  end
end
