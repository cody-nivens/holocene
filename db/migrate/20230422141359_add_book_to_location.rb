class AddBookToLocation < ActiveRecord::Migration[6.1]
  def change
    add_column :locations, :book_id, :bigint
  end
end
