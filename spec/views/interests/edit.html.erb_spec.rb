require 'spec_helper'

describe "interests/edit" do
  before(:each) do
    @interest = assign(:interest, stub_model(Interest,
      :label => "MyString",
      :uri => "MyString",
      :foaf => nil
    ))
  end

  it "renders the edit interest form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", interest_path(@interest), "post" do
      assert_select "input#interest_label[name=?]", "interest[label]"
      assert_select "input#interest_uri[name=?]", "interest[uri]"
      assert_select "input#interest_foaf[name=?]", "interest[foaf]"
    end
  end
end
