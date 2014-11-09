require 'rails_helper'

RSpec.describe "children/edit", :type => :view do
  before(:each) do
    @child = assign(:child, Child.create!())
  end

  it "renders the edit child form" do
    render

    assert_select "form[action=?][method=?]", child_path(@child), "post" do
    end
  end
end
