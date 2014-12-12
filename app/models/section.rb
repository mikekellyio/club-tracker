class Section
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Orderable

  field :name, type: String, default: "Section"

  belongs_to :book

  has_many :sub_sections

  accepts_nested_attributes_for :sub_sections
  orderable

  def book_name
    book.present? ? book.name.to_s : ""
  end
end
