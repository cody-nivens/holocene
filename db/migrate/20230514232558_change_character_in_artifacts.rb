class ChangeCharacterInArtifacts < ActiveRecord::Migration[7.0]
  def change
    change_column :artifacts, :character_id, :bigint, null: true
  end
end
