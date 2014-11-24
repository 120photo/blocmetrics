class User < ActiveRecord::Base
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
end
