class CompletedSectionsController < ApplicationController
  before_action :set_completed_section, only: [:show, :edit, :update, :destroy]

  # GET /children/:child_id/completed_sections
  # GET /children/:child_id/completed_sections.json
  def index
    @completed_sections = child.completed_sections

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @completed_sections }
    end
  end

  # GET /children/:child_id/completed_sections/1
  # GET /children/:child_id/completed_sections/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @completed_section }
    end
  end

  # GET /children/:child_id/completed_sections/new
  def new
    @completed_section = child.completed_sections.new section: child.get_next_section
  end

  # GET /children/:child_id/completed_sections/1/edit
  def edit
  end

  # POST /children/:child_id/completed_sections
  # POST /children/:child_id/completed_sections.json
  def create
    @completed_section = child.complete_next!

    respond_to do |format|
      if @completed_section.save
        format.html { redirect_to [child, @completed_section], notice: 'Completed section was successfully created.' }
        format.json { render json: @completed_section, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @completed_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /children/:child_id/completed_sections/1
  # DELETE /children/:child_id/completed_sections/1.json
  def destroy
    @completed_section.destroy
    respond_to do |format|
      format.html { redirect_to child_completed_sections_url(child) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_completed_section
      @completed_section = child.completed_sections.where(id_params).first
    end

    def child
      @child ||= Child.where(id: child_id_params["child_id"]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def completed_section_params
      params.fetch(:completed_section, {}).permit(:section)
    end

    def child_id_params
      params.permit(:child_id)
    end

    def id_params
      params.permit(:id)
    end
end
