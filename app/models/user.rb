class User < ActiveRecord::Base
  require 'uri'

  has_many :websites
  has_many :events
  has_one :api_key

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
        #  :confirmable

  before_create :generate_authentication_key

  def generate_authentication_key
    self.authentication_key = SecureRandom.hex(32)
  end

  def get_domain(domain)
    uri = URI.parse(domain)
    domain = "#{uri.scheme}://#{uri.host}"

    if uri.port != 80
      domain += ":#{uri.port}"
    end
    return domain
  end

end
