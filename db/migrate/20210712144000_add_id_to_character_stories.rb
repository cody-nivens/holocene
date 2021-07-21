class AddIdToCharacterStories < ActiveRecord::Migration[6.0]
  def change
    add_column :character_stories, :id, :primary_key
  end
end
