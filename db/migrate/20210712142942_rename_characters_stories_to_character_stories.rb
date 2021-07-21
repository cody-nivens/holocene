class RenameCharactersStoriesToCharacterStories < ActiveRecord::Migration[6.0]
  def change
    rename_table :characters_stories, :character_stories
  end
end
