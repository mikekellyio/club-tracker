require 'rails_helper'

RSpec.describe SubSection, :type => :model do
  before do
    SubSection.delete_all
  end
  describe "#name" do
    it "is position when the name attribute is blank" do
      SubSection.create
      section = SubSection.create
      expect(section.name).to eq 2
    end
  end
end
