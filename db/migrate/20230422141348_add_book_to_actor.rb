class AddBookToActor < ActiveRecord::Migration[6.1]
  def change
    add_column :actors, :book_id, :bigint
  end
end
