class AddTimestampsToCharactersScenes < ActiveRecord::Migration[6.0]
  def change
    add_column :characters_scenes, :created_at, :datetime, null: false
    add_column :characters_scenes, :updated_at, :datetime, null: false
  end
end
