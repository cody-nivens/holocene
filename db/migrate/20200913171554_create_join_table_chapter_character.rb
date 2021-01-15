class CreateJoinTableChapterCharacter < ActiveRecord::Migration[6.0]
  def change
    create_join_table :chapters, :characters do |t|
       t.index [:chapter_id, :character_id], :name => 'index_chapter_character_1'
       t.index [:character_id, :chapter_id], :name => 'index_chapter_character_2'
    end
  end
end
