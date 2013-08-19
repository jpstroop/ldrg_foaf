require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the InterestsHelper. For example:
#
describe InterestsHelper do
  describe "#label_for_uri" do
    it "returns a label when one is found" do
      uri = "http://id.loc.gov/authorities/subjects/sh98000284"
      label = "Ad hominem arguments"
      label_for_uri(uri).should eq label
    end
    it "returns an empty string when no label is available" do
    end
  end
end
