require 'rails_helper'

RSpec.describe "sections/edit", :type => :view do
  before(:each) do
    @section = assign(:section, Section.create!(
      :name => "MyString",
      :book_id => 1
    ))
  end

  it "renders the edit section form" do
    render

    assert_select "form[action=?][method=?]", section_path(@section), "post" do

      assert_select "input#section_name[name=?]", "section[name]"

      assert_select "input#section_book_id[name=?]", "section[book_id]"
    end
  end
end
