class Website < ActiveRecord::Base
  belongs_to :user
  has_many :events
  validates :url, uniqueness: true

  def verify!
    # @website = website.id
    begin
      response = HTTParty.get(self.url)
      doc = Nokogiri::HTML(response)
      # use snippet below to find key
      puts doc.xpath("//meta[@name='blocmetrics']").inspect
      key = doc.xpath("//meta[@name='blocmetrics']").last['value']
      if key == self.verification_token
        self.verified = true
        self.save
        return true
      else
        false
      end
    rescue
      return false
    end
  end

end
