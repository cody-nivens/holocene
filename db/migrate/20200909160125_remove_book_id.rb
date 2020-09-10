class RemoveBookId < ActiveRecord::Migration[6.0]
  def change
    remove_column :chapters, :book_id
    remove_column :key_points, :book_id
  end
end
