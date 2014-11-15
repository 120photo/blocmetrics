class WebsitesController < ApplicationController
  before_filter :authenticate_user!
  require 'securerandom'

  def index
    @websites = current_user.websites.all
  end

  def new
  end

  def show
    @website = Website.find(params[:id])
  end

  def edit
    @website = Website.find(params[:id])
  end

  def create
    @site = Website.new(params.require(:website).permit(:name, :url))
    @site.user = current_user
    @site.verification_token = SecureRandom.hex(12)
    @site.save
    if @site.save
      flash[:notice] = "Site Added"
    else
      flash[:error] = "Sorry, someone is already claiming that site"
    end
    redirect_to websites_url
  end

  def destroy
  end

  def update
    @website = Website.find(params[:id])
    if @website.update_attributes(params.require(:website).permit(:name, :url))
      flash[:notice] = "Info Modified."
      redirect_to @website
    else
      flash[:error] = "Error Editing Info"
      render :new
    end
  end


end
