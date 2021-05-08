class AddPositionToCharacterCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :character_categories, :position, :integer
  end
end
