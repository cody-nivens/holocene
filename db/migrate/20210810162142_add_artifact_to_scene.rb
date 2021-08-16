class AddArtifactToScene < ActiveRecord::Migration[6.0]
  def change
    add_column :scenes, :artifact_id, :bigint
  end
end
