class WebsitesController < ApplicationController
  before_filter :authenticate_user!
  require 'securerandom'
  require 'uri'

  def index
    @websites = current_user.websites.all
    respond_to do |format|
      format.html
      format.json { render :json => @websites }
      format.xml { render :xml => @websites }
    end
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
    @site.uri = current_user.get_domain(@site.url)
    @site.save
    if @site.save
      flash[:notice] = "Site Added"
    else
      flash[:error] = "Sorry, someone is already claiming that site"
    end
    redirect_to websites_url
  end

  def destroy
    @website = Website.find(params[:id])
    name = @website.name

    if @website.destroy
      flash[:notice] = "#{name} removed"
      redirect_to websites_url
    else
      flash[:error] = "There was an error, try again."
      redirect_to websites_url
    end
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
