class SubSection
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Orderable

  field :name, type: String, default: ""
  field :description, type: String, default: ""

  belongs_to :section
  orderable
end
