class AddPositionToSections < ActiveRecord::Migration
  def change
    add_column :sections, :position, :integer
    add_column :sub_sections, :position, :integer
  end
end
