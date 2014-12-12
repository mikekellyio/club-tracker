class SectionProgress
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :child
  belongs_to :section

  embeds_many :completed_subsections,
    class_name: "SubSectionProgress"

  validates_presence_of :section

  def get_next
    section.next_item
  end

  def complete_next!
    next_subsection = nil
    if completed_subsections.present?
      if next_subsection = completed_subsections.last.get_next
        completed_subsections << next_subsection
      end
    else
      next_subsection = completed_subsections.build(sub_section: section.sub_sections.first)
    end
    next_subsection
  end
end
