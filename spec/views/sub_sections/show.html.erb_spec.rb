require 'rails_helper'

RSpec.describe "sub_sections/show", :type => :view do
  before(:each) do
    @sub_section = assign(:sub_section, SubSection.create!(
      :name => "Name",
      :description => "MyText",
      :section_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
  end
end
