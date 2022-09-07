class AddBookToScene < ActiveRecord::Migration[6.1]
  def change
    add_column :scenes, :book_id, :bigint
  end
end
