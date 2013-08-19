require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the FoafsHelper. For example:
#
# describe FoafsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe FoafsHelper do
  describe "#shorten_namespace" do
    it "should return the short version of a uri when possible" do
      uri = 'http://xmlns.com/foaf/0.1/workInfoHomepage'
      shorten_namespace(uri).should eq 'foaf:workInfoHomepage'
    end

    it "should return the the full uri when we don't have a prefix" do
      uri = 'http://library.princeton.edu/libraries/mudd'
      shorten_namespace(uri).should eq uri
    end
  end
end
