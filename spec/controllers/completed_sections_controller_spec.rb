require 'rails_helper'

RSpec.describe CompletedSectionsController, :type => :controller do
  before do
    sign_in
  end

  # This should return the minimal set of attributes required to create a valid
  # CompletedSection. As you add validations to CompletedSection, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    section = Section.create name: "red 1", book: book
    {section: section}
  }

  let(:child_id){
    {child_id: child.id}
  }

  let(:invalid_attributes) {
    {section: nil}
  }

  let(:child) {
    Child.create first_name: "test", last_name: "child", current_book: book
  }

  let(:book) {
    book = Book.create
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CompletedSectionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all completed_sections as @completed_sections" do
      completed_section = child.completed_sections.create! valid_attributes
      get :index, {}.merge(child_id), valid_session
      expect(assigns(:completed_sections)).to eq([completed_section])
    end

    it "raises an error if the child is not found" do
      expect {
        get :index, {child_id: 0}, valid_session
      }.to raise_error
    end
  end

  describe "GET show" do
    it "assigns the requested completed_section as @completed_section" do
      completed_section = child.completed_sections.create! valid_attributes
      get :show, {:id => completed_section.to_param}.merge(child_id), valid_session
      expect(assigns(:completed_section)).to eq(completed_section)
    end
  end

  describe "GET new" do
    it "assigns a new completed_section as @completed_section" do
      get :new, {}.merge(child_id), valid_session
      expect(assigns(:completed_section)).to be_a_new(CompletedSection)
    end
  end

  describe "GET edit" do
    it "assigns the requested completed_section as @completed_section" do
      completed_section = child.completed_sections.create! valid_attributes
      get :edit, {:id => completed_section.to_param}.merge(child_id), valid_session
      expect(assigns(:completed_section)).to eq(completed_section)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new CompletedSection" do
        expect {
          post :create, {:completed_section => valid_attributes}.merge(child_id), valid_session
        }.to change { child.reload.completed_sections.count }.by(1)
      end

      it "assigns a newly created completed_section as @completed_section" do
        post :create, {:completed_section => valid_attributes}.merge(child_id), valid_session
        expect(assigns(:completed_section)).to be_a(CompletedSection)
        expect(assigns(:completed_section)).to be_persisted
      end

      it "redirects to the created completed_section" do
        post :create, {:completed_section => valid_attributes}.merge(child_id), valid_session
        expect(response).to redirect_to([child, child.reload.completed_sections.last])
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved completed_section as @completed_section" do
        post :create, {:completed_section => invalid_attributes}.merge(child_id), valid_session
        expect(assigns(:completed_section)).to be_a_new(CompletedSection)
      end

      it "re-renders the 'new' template" do
        post :create, {:completed_section => invalid_attributes}.merge(child_id), valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested completed_section" do
      completed_section = child.completed_sections.create! valid_attributes
      expect {
        delete :destroy, {:id => completed_section.to_param}.merge(child_id), valid_session
      }.to change {child.reload.completed_sections.count}.by(-1)
    end

    it "redirects to the completed_sections list" do
      completed_section = child.completed_sections.create! valid_attributes
      delete :destroy, {:id => completed_section.to_param}.merge(child_id), valid_session
      expect(response).to redirect_to(child_completed_sections_url(child))
    end
  end

end
