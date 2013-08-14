require 'spec_helper'

describe "foafs/edit" do
  before(:each) do
    @foaf = assign(:foaf, stub_model(Foaf))
  end

  it "renders the edit foaf form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", foaf_path(@foaf), "post" do
    end
  end
end
