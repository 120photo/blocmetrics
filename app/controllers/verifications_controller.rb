class VerificationsController < ApplicationController

  def update
    @website = Website.find(params[:id])

    # AutoVerifySites.perform_async(@website.id)
    #
    # redirect_to @website, notice: "We are checking to see if your site is verified."
    if @website.verify!
      redirect_to @website, notice: "Successfully verified #{@website.url}"
    else
      redirect_to @website, notice: "could not find 'blocmetrics' meta tag in  #{@website.url}"
    end
  end

end
