class Club
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_many :children
  embeds_many :teams

  field :name, type: String
end
