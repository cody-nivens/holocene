class RenameCharactersScenesTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :characters_scenes, :character_scenes
  end
end
