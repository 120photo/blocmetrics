class ApiKey < ActiveRecord::Base
  require 'securerandom'
  # before_create :generate_api_key

  belongs_to :user

  private

  # def generate_api_key
  #   ApiKey.new(
  #     self.access_token = SecureRandom.hex
  #     self.user = current_user
  #   )
  # end
end
