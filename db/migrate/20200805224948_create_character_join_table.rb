class CreateCharacterJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :books, :characters do |t|
      # t.index [:character_id, :book_id]
      t.index [:book_id, :character_id], unique: true
    end
  end
end
