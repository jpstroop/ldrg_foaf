require 'spec_helper'

describe "interests/index" do
  before(:each) do
    assign(:interests, [
      stub_model(Interest,
        :label => "Label",
        :uri => "Uri",
        :foaf => nil
      ),
      stub_model(Interest,
        :label => "Label",
        :uri => "Uri",
        :foaf => nil
      )
    ])
  end

  it "renders a list of interests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Label".to_s, :count => 2
    assert_select "tr>td", :text => "Uri".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
