require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe InterestsController do

  # This should return the minimal set of attributes required to create a valid
  # Interest. As you add validations to Interest, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "label" => "MyString" } }

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

  describe "GET show" do
    it "assigns the requested interest as @interest" do
      interest = Interest.create! valid_attributes
      get :show, {:id => interest.to_param}, valid_session
      assigns(:interest).should eq(interest)
    end
  end

  describe "GET new" do
    it "assigns a new interest as @interest" do
      get :new, {}, valid_session
      assigns(:interest).should be_a_new(Interest)
    end
  end

  describe "GET edit" do
    it "assigns the requested interest as @interest" do
      interest = Interest.create! valid_attributes
      get :edit, {:id => interest.to_param}, valid_session
      assigns(:interest).should eq(interest)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Interest" do
        expect {
          post :create, {:interest => valid_attributes}, valid_session
        }.to change(Interest, :count).by(1)
      end

      it "assigns a newly created interest as @interest" do
        post :create, {:interest => valid_attributes}, valid_session
        assigns(:interest).should be_a(Interest)
        assigns(:interest).should be_persisted
      end

      it "redirects to the created interest" do
        post :create, {:interest => valid_attributes}, valid_session
        response.should redirect_to(Interest.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved interest as @interest" do
        # Trigger the behavior that occurs when invalid params are submitted
        Interest.any_instance.stub(:save).and_return(false)
        post :create, {:interest => { "label" => "invalid value" }}, valid_session
        assigns(:interest).should be_a_new(Interest)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Interest.any_instance.stub(:save).and_return(false)
        post :create, {:interest => { "label" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested interest" do
        interest = Interest.create! valid_attributes
        # Assuming there are no other interests in the database, this
        # specifies that the Interest created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Interest.any_instance.should_receive(:update).with({ "label" => "MyString" })
        put :update, {:id => interest.to_param, :interest => { "label" => "MyString" }}, valid_session
      end

      it "assigns the requested interest as @interest" do
        interest = Interest.create! valid_attributes
        put :update, {:id => interest.to_param, :interest => valid_attributes}, valid_session
        assigns(:interest).should eq(interest)
      end

      it "redirects to the interest" do
        interest = Interest.create! valid_attributes
        put :update, {:id => interest.to_param, :interest => valid_attributes}, valid_session
        response.should redirect_to(interest)
      end
    end

    describe "with invalid params" do
      it "assigns the interest as @interest" do
        interest = Interest.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Interest.any_instance.stub(:save).and_return(false)
        put :update, {:id => interest.to_param, :interest => { "label" => "invalid value" }}, valid_session
        assigns(:interest).should eq(interest)
      end

      it "re-renders the 'edit' template" do
        interest = Interest.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Interest.any_instance.stub(:save).and_return(false)
        put :update, {:id => interest.to_param, :interest => { "label" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested interest" do
      interest = Interest.create! valid_attributes
      expect {
        delete :destroy, {:id => interest.to_param}, valid_session
      }.to change(Interest, :count).by(-1)
    end

    it "redirects to the interests list" do
      interest = Interest.create! valid_attributes
      delete :destroy, {:id => interest.to_param}, valid_session
      response.should redirect_to(interests_url)
    end
  end

end
