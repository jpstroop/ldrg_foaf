require 'spec_helper'

describe FoafsController do

  # This should return the minimal set of attributes required to create a valid
  # Foaf. As you add validations to Foaf, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { 
    ident: "jstroop",
    name: "Jon Stroop",
    work: "http://library.princeton.edu",
    birthday: "1977-06-16"
  } }


  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FoafsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all foafs as @foafs" do
      foaf = Foaf.create! valid_attributes
      get :index, {}, valid_session
      assigns(:foafs).should eq([foaf])
    end
  end

  describe "GET show" do
    it "assigns the requested foaf as @foaf" do
      foaf = Foaf.create! valid_attributes
      get :show, {:id => foaf.to_param}, valid_session
      assigns(:foaf).should eq(foaf)
    end
  end

  describe "GET new" do
    it "assigns a new foaf as @foaf" do
      get :new, {}, valid_session
      assigns(:foaf).should be_a_new(Foaf)
    end
  end

  describe "GET edit" do
    it "assigns the requested foaf as @foaf" do
      foaf = Foaf.create! valid_attributes
      get :edit, {:id => foaf.to_param}, valid_session
      assigns(:foaf).should eq(foaf)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Foaf" do
        expect {
          post :create, {:foaf => valid_attributes}, valid_session
        }.to change(Foaf, :count).by(1)
      end

      it "assigns a newly created foaf as @foaf" do
        post :create, {:foaf => valid_attributes}, valid_session
        assigns(:foaf).should be_a(Foaf)
        assigns(:foaf).should be_persisted
      end

      it "redirects to the created foaf" do
        post :create, {:foaf => valid_attributes}, valid_session
        response.should redirect_to(Foaf.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved foaf as @foaf" do
        # Trigger the behavior that occurs when invalid params are submitted
        Foaf.any_instance.stub(:save).and_return(false)
        post :create, {:foaf => { "ident" => "invalid value" }}, valid_session
        assigns(:foaf).should be_a_new(Foaf)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Foaf.any_instance.stub(:save).and_return(false)
        post :create, {:foaf => { "ident" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested foaf" do
        foaf = Foaf.create! valid_attributes
        # Assuming there are no other foafs in the database, this
        # specifies that the Foaf created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Foaf.any_instance.should_receive(:update).with({ "ident" => "MyString" })
        put :update, {:id => foaf.to_param, :foaf => { "ident" => "MyString" }}, valid_session
      end

      it "assigns the requested foaf as @foaf" do
        foaf = Foaf.create! valid_attributes
        put :update, {:id => foaf.to_param, :foaf => valid_attributes}, valid_session
        assigns(:foaf).should eq(foaf)
      end

      it "redirects to the foaf" do
        foaf = Foaf.create! valid_attributes
        put :update, {:id => foaf.to_param, :foaf => valid_attributes}, valid_session
        response.should redirect_to(foaf)
      end
    end

    describe "with invalid params" do
      it "assigns the foaf as @foaf" do
        foaf = Foaf.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Foaf.any_instance.stub(:save).and_return(false)
        put :update, {:id => foaf.to_param, :foaf => { "ident" => "invalid value" }}, valid_session
        assigns(:foaf).should eq(foaf)
      end

      it "re-renders the 'edit' template" do
        foaf = Foaf.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Foaf.any_instance.stub(:save).and_return(false)
        put :update, {:id => foaf.to_param, :foaf => { "ident" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested foaf" do
      foaf = Foaf.create! valid_attributes
      expect {
        delete :destroy, {:id => foaf.to_param}, valid_session
      }.to change(Foaf, :count).by(-1)
    end

    it "redirects to the foafs list" do
      foaf = Foaf.create! valid_attributes
      delete :destroy, {:id => foaf.to_param}, valid_session
      response.should redirect_to(foafs_url)
    end
  end

end
