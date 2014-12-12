class SubSectionProgress
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :section_progress
  belongs_to :sub_section

  validates_presence_of :sub_section

  def get_next
    sub_section.next_items.first
  end

  def name
    sub_section.name
  end

  def description
    sub_section.description
  end

end
