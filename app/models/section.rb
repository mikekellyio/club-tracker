class Section
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String, default: "Section"

  embedded_in :book

  embeds_many :sub_sections
  accepts_nested_attributes_for :sub_sections
  orderable

  def book_name
    book.present? ? book.name.to_s : ""
  end
end
