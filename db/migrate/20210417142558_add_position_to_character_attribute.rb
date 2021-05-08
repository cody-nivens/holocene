class AddPositionToCharacterAttribute < ActiveRecord::Migration[6.0]
  def change
    add_column :character_attributes, :position, :integer
  end
end
