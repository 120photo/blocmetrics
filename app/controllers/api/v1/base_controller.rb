class Api::V1::BaseController < ApplicationController

  respond_to :json

  skip_before_filter :verify_authenticity_token

  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!

  before_filter :cors_preflight_check
  after_filter :set_headers

  private

  def authenticate_user_from_token!
    token = params[:auth_token].presence
    user = User.where(authentication_key: token).first

    logger.info user.inspect

    if user && Devise.secure_compare(user.authentication_key, token)
      sign_in user, store: false
    else
      render nothing: true, status: :unauthorized
    end
  end

  def set_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'GET, POST, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
    headers['Access-Control-Max-Age'] = '1728000'
  end

  def cors_preflight_check
    if request.method == :options
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
      headers['Access-Control-Max-Age'] = '1728000'
      render :text => '', :content_type => 'text/plain'
    end
  end

end
