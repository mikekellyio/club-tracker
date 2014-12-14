class SubSection
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Orderable

  field :name, type: String, default: ""
  field :description, type: String, default: ""

  belongs_to :section
  orderable

  def name
    read_attribute(:name).blank? ? position : read_attribute(:name)
  end
end
