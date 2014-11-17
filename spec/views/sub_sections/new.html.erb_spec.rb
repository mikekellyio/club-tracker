require 'rails_helper'

RSpec.describe "sub_sections/new", :type => :view do
  before(:each) do
    assign(:sub_section, SubSection.new(
      :name => "MyString",
      :description => "MyText",
      :section_id => 1
    ))
  end

  it "renders new sub_section form" do
    render

    assert_select "form[action=?][method=?]", sub_sections_path, "post" do

      assert_select "input#sub_section_name[name=?]", "sub_section[name]"

      assert_select "textarea#sub_section_description[name=?]", "sub_section[description]"

      assert_select "input#sub_section_section_id[name=?]", "sub_section[section_id]"
    end
  end
end
