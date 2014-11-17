require 'rails_helper'

RSpec.describe "SubSections", :type => :request do
  describe "GET /sub_sections" do
    it "works! (now write some real specs)" do
      get sub_sections_path
      expect(response).to have_http_status(200)
    end
  end
end
