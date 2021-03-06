class SubSectionsController < ApplicationController
  before_action :set_sub_section, only: [:show, :edit, :update, :destroy]

  def index
    @sub_sections = SubSection.all
    respond_with(@sub_sections)
  end

  def show
    respond_with(@sub_section)
  end

  def new
    @sub_section = SubSection.new
    respond_with(@sub_section)
  end

  def edit
  end

  def create
    @sub_section = SubSection.new(sub_section_params)
    @sub_section.save
    respond_with(@sub_section)
  end

  def update
    @sub_section.update(sub_section_params)
    respond_with(@sub_section)
  end

  def destroy
    @sub_section.destroy
    respond_with(@sub_section)
  end

  private
    def set_sub_section
      @sub_section = SubSection.find(params[:id])
    end

    def sub_section_params
      params.require(:sub_section).permit(:name, :description, :section_id)
    end
end
