class Team < ActiveRecord::Base
  has_many :children
end
