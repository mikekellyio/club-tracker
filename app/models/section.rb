class Section < ActiveRecord::Base
  belongs_to :book
  acts_as_list scope: :book
  has_many :sub_sections, -> { order("position ASC") }
  accepts_nested_attributes_for :sub_sections

  def book_name
    book.present? ? book.name.to_s : ""
  end
end
