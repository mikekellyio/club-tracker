class Team < ActiveRecord::Base
  validates_presence_of :name

  has_many :children
  accepts_nested_attributes_for :children
end
