require 'spec_helper'

describe Foaf do

  let(:valid_attributes) { { 
    ident: "jstroop",
    name: "Jon Stroop",
    work: "http://library.princeton.edu",
    birthday: "1977-06-16"
  } }

	it "is invalid if work, ident, birthday or name are empty" do
	  f = Foaf.new
	  f.invalid?.should be_true
	end

  it "works with valid attributes" do
    f = Foaf.create! valid_attributes
    f.valid?.should be_true
  end


  it "doesn't allow spaces, numbers, or caps in ident" do

    def new_foaf_from_ident(ident) 
      Foaf.create ident: ident, work: "http://library.princeton.edu", birthday: "1977-06-16", name: "Jon Stroop" 
    end 
    
    bad = ['Jstroop','jon stroop', 'jstroop1']

    bad.each do |ident|
      f = new_foaf_from_ident(ident)
      f.invalid?.should be_true
    end
  end

  it "only allows URIs in work" do
    f = Foaf.create ident: "jstroop", work: "Princeton", birthday: "1977-06-16", name: "Jon Stroop" 
    f.valid?.should be_false
  end


end
