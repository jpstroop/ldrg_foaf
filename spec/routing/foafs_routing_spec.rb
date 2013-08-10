require "spec_helper"

describe FoafsController do
  describe "routing" do

    it "routes to #index" do
      get("/foafs").should route_to("foafs#index")
    end

    it "routes to #new" do
      get("/foafs/new").should route_to("foafs#new")
    end

    it "routes to #show" do
      get("/foafs/1").should route_to("foafs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/foafs/1/edit").should route_to("foafs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/foafs").should route_to("foafs#create")
    end

    it "routes to #update" do
      put("/foafs/1").should route_to("foafs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/foafs/1").should route_to("foafs#destroy", :id => "1")
    end

  end
end
