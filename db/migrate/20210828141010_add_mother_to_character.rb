class AddMotherToCharacter < ActiveRecord::Migration[6.0]
  def change
    add_reference :characters, :mother, null: true
  end
end
