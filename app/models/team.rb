class Team
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :club

  field :name, type: String

  validates_presence_of :name

  has_many :children
  accepts_nested_attributes_for :children
end
