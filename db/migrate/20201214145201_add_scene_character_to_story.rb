class AddSceneCharacterToStory < ActiveRecord::Migration[6.0]
  def change
    add_column :stories, :scene_character, :string
  end
end
