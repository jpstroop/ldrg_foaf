require 'spec_helper'

describe InterestsController do

  # This should return the minimal set of attributes required to create a valid
  # Interest. As you add validations to Interest, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { 
    label: "Wine and winemaking",
    uri: "http://id.loc.gov/authorities/subjects/sh85146975"
  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # InterestsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all interests as @interests" do
      interest = Interest.create! valid_attributes
      get :index, {}, valid_session
      assigns(:interests).should eq([interest])
    end
  end

end