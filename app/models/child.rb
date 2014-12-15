class Child
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :club
  belongs_to :team

  field :first_name, type: String
  field :last_name, type: String
  validates_presence_of :first_name, :last_name

  belongs_to :current_book,
          class_name: "Book",
          inverse_of: "children_in_progress"
  has_and_belongs_to_many :completed_books,
          class_name: "Book",
          inverse_of: "children_who_have_completed"

  embeds_many :completed_sections

  def name
    "#{first_name} #{last_name}"
  end

  def get_next_section
    if completed_sections.present?
      completed_sections.last.get_next
    else
      unless current_book.present?
        self.current_book = Book.first
      end
      current_book.sections.first
    end
  end

  def complete_next!
    raise StandardError, "no current book set" unless current_book.present?

    if completed_sections.present?
      completed = completed_sections.last.complete_next!
      if completed.blank?

        next_section = get_next_section
        if next_section.present?
          completed_sections.build(section: next_section)
        else
          self.completed_books << current_book
          get_next_section
        end
      end
    else
      completed_sections.build section: current_book.sections.first
    end
  end
end
