class ApiKeysController < ApplicationController

  def new
    @key = ApiKey.new()
  end

  def create
    @key = ApiKey.new(
      user: current_user,
      access_token: SecureRandom.hex
    )
    @key.save
    redirect_to '/websites'
  end

end
