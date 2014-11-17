require "rails_helper"

RSpec.describe SubSectionsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/sub_sections").to route_to("sub_sections#index")
    end

    it "routes to #new" do
      expect(:get => "/sub_sections/new").to route_to("sub_sections#new")
    end

    it "routes to #show" do
      expect(:get => "/sub_sections/1").to route_to("sub_sections#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/sub_sections/1/edit").to route_to("sub_sections#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/sub_sections").to route_to("sub_sections#create")
    end

    it "routes to #update" do
      expect(:put => "/sub_sections/1").to route_to("sub_sections#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/sub_sections/1").to route_to("sub_sections#destroy", :id => "1")
    end

  end
end
