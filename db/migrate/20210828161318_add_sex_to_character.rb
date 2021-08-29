class AddSexToCharacter < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :sex, :integer, default: 0
  end
end
