require 'spec_helper'

describe "foafs/show" do
  before(:each) do
    @foaf = assign(:foaf, stub_model(Foaf))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
