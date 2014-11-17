require 'rails_helper'

RSpec.describe "sub_sections/index", :type => :view do
  before(:each) do
    assign(:sub_sections, [
      SubSection.create!(
        :name => "Name",
        :description => "MyText",
        :section_id => 1
      ),
      SubSection.create!(
        :name => "Name",
        :description => "MyText",
        :section_id => 1
      )
    ])
  end

  it "renders a list of sub_sections" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
