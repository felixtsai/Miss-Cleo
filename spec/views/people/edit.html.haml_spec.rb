require 'spec_helper'

describe "people/edit" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
      :name => "MyString",
      :height => 1,
      :weight => 1,
      :sex => "MyString"
    ))
  end

  it "renders the edit person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => people_path(@person), :method => "post" do
      assert_select "input#person_name", :name => "person[name]"
      assert_select "input#person_height", :name => "person[height]"
      assert_select "input#person_weight", :name => "person[weight]"
      assert_select "input#person_sex", :name => "person[sex]"
    end
  end
end
