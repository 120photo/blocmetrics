class Api::V1::BaseController < ApplicationController

  before_filter :cors_preflight_check
  after_filter :corse_set_headers

  respond_to :json

  before_filter :authenticate_user_from_token!

  # This is Devise's authentication
  before_filter :authenticate_user!

  private

  def authenticate_user_from_token!
    user_token = params[:auth_token].presence
    user       = user_token && User.where(authentication_key: user_token).first

    # Notice how we use Devise.secure_compare to compare the token
    # in the database with the token given in the params, mitigating
    # timing attacks.
    if user
      sign_in user, store: false
    end
  end


  private

  def cors_set_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'GET, POST, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Content-Type'
    headers['Access-Control-Max-Age'] = '1728000'
  end

  def cors_preflight_check
    if request.method == :options
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
      headers['Access-Control-Max-Age'] = '1728000'
    end
  end

end
