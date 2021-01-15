class AddSceneCharacterToBook < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :scene_character, :string
  end
end
