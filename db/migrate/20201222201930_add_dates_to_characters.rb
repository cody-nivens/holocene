class AddDatesToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :birth_year, :integer
    add_column :characters, :death_year, :integer
    add_column :characters, :father_id, :integer
  end
end
