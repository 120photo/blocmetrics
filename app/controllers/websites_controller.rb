class WebsitesController < ApplicationController
  before_filter :authenticate_user!

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
  end

  def destroy
  end

  def update
  end
end
