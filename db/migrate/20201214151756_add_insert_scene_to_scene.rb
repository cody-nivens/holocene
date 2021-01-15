class AddInsertSceneToScene < ActiveRecord::Migration[6.0]
  def change
    add_column :scenes, :insert_scene_id, :integer
  end
end
