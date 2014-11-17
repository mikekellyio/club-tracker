require 'rails_helper'

RSpec.describe "sections/index", :type => :view do
  before(:each) do
    assign(:sections, [
      Section.create!(
        :name => "Name",
        :book_id => 1
      ),
      Section.create!(
        :name => "Name",
        :book_id => 1
      )
    ])
  end

  it "renders a list of sections" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
