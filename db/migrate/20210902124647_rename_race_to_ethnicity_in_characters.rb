class RenameRaceToEthnicityInCharacters < ActiveRecord::Migration[6.0]
  def change
    rename_column :characters, :race, :ethnicity
  end
end
