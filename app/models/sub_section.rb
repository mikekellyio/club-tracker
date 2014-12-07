class SubSection
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String, default: ""
  field :description, type: String, default: ""

  embedded_in :section
  orderable
end
