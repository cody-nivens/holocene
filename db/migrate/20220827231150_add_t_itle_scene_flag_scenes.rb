class AddTItleSceneFlagScenes < ActiveRecord::Migration[6.1]
  def change
    add_column :scenes, :title_scene, :boolean, default: false
  end
end
