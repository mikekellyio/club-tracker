class Child < ActiveRecord::Base
  belongs_to :team

  has_many :associated_books
  has_many :completed_associated_books,
           class_name: "AssociatedBook",
           -> { where completed: true}

  has_many :books, through: :associated_books
  has_many :completed_books, through: :completed_associated_books

  def name
    "#{first_name} #{last_name}"
  end
end
