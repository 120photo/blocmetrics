require 'rails_helper'


describe Website do
  describe "verify method" do

    before do
      @website = Website.create(name: 'website name', url: 'site url', verification_token: SecureRandom.hex)
    end

  end
end
