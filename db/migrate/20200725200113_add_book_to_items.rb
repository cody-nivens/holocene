class AddBookToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :key_points, :book_id, :integer
    add_column :scenes, :book_id, :integer
  end
end
