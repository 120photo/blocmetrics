class MainController < ApplicationController
  def index
    if current_user
      redirect_to websites_path
    end 
  end
end
