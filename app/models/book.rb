class Book < ActiveRecord::Base
  has_many :sections, -> { order("position ASC") }
  accepts_nested_attributes_for :sections

  has_many :associated_children,
           class_name: "AssociatedBook"
  has_many :completed_associated_children,
           class_name: "AssociatedBook",
           -> { where completed: true}

  has_many :children,
           through: :associated_children
  has_many :children_who_have_completed,
           through: :completed_associated_children
end
