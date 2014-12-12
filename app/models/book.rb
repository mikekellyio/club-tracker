class Book
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Orderable
  orderable

  field :name, type: String, default: "Book"

  has_many :sections
  accepts_nested_attributes_for :sections

  has_many :children_in_progress,
           class_name: "Child",
           inverse_of: "current_book"
  has_and_belongs_to_many :children_who_have_completed,
           class_name: "Child",
           inverse_of: "completed_books"

  def get_next
    next_item
  end
end
