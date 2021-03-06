require 'rails_helper'

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

RSpec.describe SubSectionsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # SubSection. As you add validations to SubSection, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SubSectionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all sub_sections as @sub_sections" do
      sub_section = SubSection.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:sub_sections)).to eq([sub_section])
    end
  end

  describe "GET show" do
    it "assigns the requested sub_section as @sub_section" do
      sub_section = SubSection.create! valid_attributes
      get :show, {:id => sub_section.to_param}, valid_session
      expect(assigns(:sub_section)).to eq(sub_section)
    end
  end

  describe "GET new" do
    it "assigns a new sub_section as @sub_section" do
      get :new, {}, valid_session
      expect(assigns(:sub_section)).to be_a_new(SubSection)
    end
  end

  describe "GET edit" do
    it "assigns the requested sub_section as @sub_section" do
      sub_section = SubSection.create! valid_attributes
      get :edit, {:id => sub_section.to_param}, valid_session
      expect(assigns(:sub_section)).to eq(sub_section)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SubSection" do
        expect {
          post :create, {:sub_section => valid_attributes}, valid_session
        }.to change(SubSection, :count).by(1)
      end

      it "assigns a newly created sub_section as @sub_section" do
        post :create, {:sub_section => valid_attributes}, valid_session
        expect(assigns(:sub_section)).to be_a(SubSection)
        expect(assigns(:sub_section)).to be_persisted
      end

      it "redirects to the created sub_section" do
        post :create, {:sub_section => valid_attributes}, valid_session
        expect(response).to redirect_to(SubSection.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sub_section as @sub_section" do
        post :create, {:sub_section => invalid_attributes}, valid_session
        expect(assigns(:sub_section)).to be_a_new(SubSection)
      end

      it "re-renders the 'new' template" do
        post :create, {:sub_section => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested sub_section" do
        sub_section = SubSection.create! valid_attributes
        put :update, {:id => sub_section.to_param, :sub_section => new_attributes}, valid_session
        sub_section.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested sub_section as @sub_section" do
        sub_section = SubSection.create! valid_attributes
        put :update, {:id => sub_section.to_param, :sub_section => valid_attributes}, valid_session
        expect(assigns(:sub_section)).to eq(sub_section)
      end

      it "redirects to the sub_section" do
        sub_section = SubSection.create! valid_attributes
        put :update, {:id => sub_section.to_param, :sub_section => valid_attributes}, valid_session
        expect(response).to redirect_to(sub_section)
      end
    end

    describe "with invalid params" do
      it "assigns the sub_section as @sub_section" do
        sub_section = SubSection.create! valid_attributes
        put :update, {:id => sub_section.to_param, :sub_section => invalid_attributes}, valid_session
        expect(assigns(:sub_section)).to eq(sub_section)
      end

      it "re-renders the 'edit' template" do
        sub_section = SubSection.create! valid_attributes
        put :update, {:id => sub_section.to_param, :sub_section => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested sub_section" do
      sub_section = SubSection.create! valid_attributes
      expect {
        delete :destroy, {:id => sub_section.to_param}, valid_session
      }.to change(SubSection, :count).by(-1)
    end

    it "redirects to the sub_sections list" do
      sub_section = SubSection.create! valid_attributes
      delete :destroy, {:id => sub_section.to_param}, valid_session
      expect(response).to redirect_to(sub_sections_url)
    end
  end

end
