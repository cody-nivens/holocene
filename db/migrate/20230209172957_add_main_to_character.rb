class AddMainToCharacter < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :main, :boolean, default: false
  end
end
