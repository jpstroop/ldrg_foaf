require 'spec_helper'

describe "foafs/new" do
  before(:each) do
    assign(:foaf, stub_model(Foaf).as_new_record)
  end

  it "renders new foaf form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", foafs_path, "post" do
    end
  end
end
