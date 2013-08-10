require 'spec_helper'

describe "foafs/index" do
  before(:each) do
    assign(:foafs, [
      stub_model(Foaf,
        :ident => "Ident",
        :name => "Name",
        :work => "Work"
      ),
      stub_model(Foaf,
        :ident => "Ident",
        :name => "Name",
        :work => "Work"
      )
    ])
  end

  it "renders a list of foafs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Ident".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Work".to_s, :count => 2
  end
end
