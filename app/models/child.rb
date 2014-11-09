class Child < ActiveRecord::Base
  belongs_to :team

  def name
    "#{first_name} #{last_name}"
  end
end
