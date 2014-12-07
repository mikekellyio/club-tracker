class Child
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :club
  belongs_to :team

  field :first_name, type: String
  field :last_name, type: String
  validates_presence_of :first_name, :last_name

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
