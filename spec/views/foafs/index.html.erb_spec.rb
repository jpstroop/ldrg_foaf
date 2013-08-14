require 'spec_helper'

describe "foafs/index" do
  before(:each) do
    assign(:foafs, [
      stub_model(Foaf),
      stub_model(Foaf)
    ])
  end

  it "renders a list of foafs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
