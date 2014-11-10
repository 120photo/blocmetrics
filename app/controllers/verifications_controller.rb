class VerificationsController < ApplicationController

  def update
    @website = Website.find(params[:id])
    if @website.verify!
      redirect_to @website, notice: "Successfully verified #{@website.url}"
    else
      redirect_to @website, notice: "could not find 'blocmetrics' meta tag in  #{@website.url}"
    end
  end

end
