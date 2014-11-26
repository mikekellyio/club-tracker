class SubSection < ActiveRecord::Base
  belongs_to :section
  acts_as_list scope: :section
end
