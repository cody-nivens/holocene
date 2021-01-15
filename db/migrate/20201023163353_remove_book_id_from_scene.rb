class RemoveBookIdFromScene < ActiveRecord::Migration[6.0]
  def change
    remove_column :scenes, :book_id
  end
end
