require 'spec_helper'

describe "people/index" do
  before(:each) do
    assign(:people, [
      stub_model(Person,
        :name => "Name",
        :height => 1,
        :weight => 2,
        :sex => "Sex"
      ),
      stub_model(Person,
        :name => "Name",
        :height => 1,
        :weight => 2,
        :sex => "Sex"
      )
    ])
  end

  it "renders a list of people" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Sex".to_s, :count => 2
  end
end
