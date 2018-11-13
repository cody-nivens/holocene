class AddBookIdToChapter < ActiveRecord::Migration[5.2]
  def change
      add_column :chapters, :book_id, :integer
  end
end
