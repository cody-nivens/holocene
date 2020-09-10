class CreateJoinTableCharacterStory < ActiveRecord::Migration[6.0]
  def change
    create_join_table :stories, :characters do |t|
       t.index [:story_id, :character_id], :name => 'index_story_character_1'
       t.index [:character_id, :story_id], :name => 'index_story_character_2'
    end
  end
end
