class Book
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String, default: "Book"

  embeds_many :sections
  accepts_nested_attributes_for :sections

  has_and_belongs_to_many :children
  has_and_belongs_to_many :children_who_have_completed,
           class_name: "Child",
           inverse_of: "completed_books"
end
