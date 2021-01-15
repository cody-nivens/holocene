class CreateJoinTableCharacterScene < ActiveRecord::Migration[6.0]
  def change
    create_join_table :characters, :scenes do |t|
       t.index [:character_id, :scene_id], :name => 'index_scene_character_1'
       t.index [:scene_id, :character_id], :name => 'index_scene_character_2'
    end
  end
end
