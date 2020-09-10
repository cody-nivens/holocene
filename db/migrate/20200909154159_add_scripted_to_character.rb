class AddScriptedToCharacter < ActiveRecord::Migration[6.0]
  def change
    add_reference :characters, :scripted, polymorphic: true, null: false
  end
end
