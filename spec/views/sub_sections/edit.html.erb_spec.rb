require 'rails_helper'

RSpec.describe "sub_sections/edit", :type => :view do
  before(:each) do
    @sub_section = assign(:sub_section, SubSection.create!(
      :name => "MyString",
      :description => "MyText",
      :section_id => 1
    ))
  end

  it "renders the edit sub_section form" do
    render

    assert_select "form[action=?][method=?]", sub_section_path(@sub_section), "post" do

      assert_select "input#sub_section_name[name=?]", "sub_section[name]"

      assert_select "textarea#sub_section_description[name=?]", "sub_section[description]"

      assert_select "input#sub_section_section_id[name=?]", "sub_section[section_id]"
    end
  end
end
