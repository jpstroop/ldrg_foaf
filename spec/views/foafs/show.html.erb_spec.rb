require 'spec_helper'

describe "foafs/show" do
  before(:each) do
    @foaf = assign(:foaf, stub_model(Foaf,
      :ident => "Ident",
      :name => "Name",
      :work => "Work"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Ident/)
    rendered.should match(/Name/)
    rendered.should match(/Work/)
  end
end
