class Section < ActiveRecord::Base
  belongs_to :book
  has_many :sub_sections

  def book_name
    book.present? ? book.name.to_s : ""
  end
end
