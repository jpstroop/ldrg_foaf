require 'spec_helper'

describe "interests/new" do
  before(:each) do
    assign(:interest, stub_model(Interest,
      :label => "MyString",
      :uri => "MyString",
      :foaf => nil
    ).as_new_record)
  end

  it "renders new interest form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", interests_path, "post" do
      assert_select "input#interest_label[name=?]", "interest[label]"
      assert_select "input#interest_uri[name=?]", "interest[uri]"
      assert_select "input#interest_foaf[name=?]", "interest[foaf]"
    end
  end
end
