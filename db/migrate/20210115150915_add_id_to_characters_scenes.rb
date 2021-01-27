class AddIdToCharactersScenes < ActiveRecord::Migration[6.0]
  def change
    add_column :characters_scenes, :id, :primary_key
  end
end
