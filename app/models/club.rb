class Club
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :children
  embeds_many :teams
  belongs_to :organization

  field :name, type: String
  validates_presence_of :name
end
