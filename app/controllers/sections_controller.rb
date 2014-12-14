class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def index
    @sections = book.sections
    respond_with(@sections)
  end

  def show
    respond_with(@section)
  end

  def new
    @section = Section.new
    respond_with(@section)
  end

  def edit
  end

  def create
    @section = book.sections.new(section_params)
    @section.save
    respond_with(@section)
  end

  def update
    @section.update(section_params)
    respond_with(@section)
  end

  def destroy
    @section.destroy
    respond_with(@section, location: book_sections_url(@section.book))
  end

  private
    def set_section
      @section = Section.find(params[:id])
    end

    def book_id
      params.require(:book_id)
    end

    def book
      @book ||= Book.find(book_id)
    end

    def section_params
      params.fetch(:section, {}).permit(
          :name,
          :book_id,
          :position,
          {sub_sections_attributes:
              [:name, :decription, :position]}
          )
    end
end
