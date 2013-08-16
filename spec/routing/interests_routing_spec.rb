require "spec_helper"

describe InterestsController do
  describe "routing" do

    it "routes to #index" do
      get("/interests").should route_to(controller: 'interests', action: 'index', format: 'json')
      get("/interests.json").should route_to(controller: 'interests', action: 'index', format: 'json')
    end

  end
end
