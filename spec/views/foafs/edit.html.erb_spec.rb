require 'spec_helper'

describe "foafs/edit" do
  before(:each) do
    @foaf = assign(:foaf, stub_model(Foaf,
      :ident => "MyString",
      :name => "MyString",
      :work => "MyString"
    ))
  end

  it "renders the edit foaf form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", foaf_path(@foaf), "post" do
      assert_select "input#foaf_ident[name=?]", "foaf[ident]"
      assert_select "input#foaf_name[name=?]", "foaf[name]"
      assert_select "input#foaf_work[name=?]", "foaf[work]"
    end
  end
end
