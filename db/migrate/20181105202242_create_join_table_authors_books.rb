class CreateJoinTableAuthorsBooks < ActiveRecord::Migration[5.2]
  def change
    create_join_table :authors, :books do |t|
       t.index [:author_id, :book_id],  :name => 'index_author_book_1'
       t.index [:book_id, :author_id],  :name => 'index_author_book_2'
    end
  end
end
