class CreateAssociatedBooks < ActiveRecord::Migration
  def change
    create_table :associated_books do |t|
      t.integer :child_id
      t.integer :book_id
      t.boolean :completed

      t.timestamps
    end
  end
end
