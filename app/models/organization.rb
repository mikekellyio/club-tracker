class Organization
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :clubs

  field :name, type: String
  validates_presence_of :name
end
