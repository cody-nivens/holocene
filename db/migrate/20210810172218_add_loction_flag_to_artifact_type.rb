class AddLoctionFlagToArtifactType < ActiveRecord::Migration[6.0]
  def change
    add_column :artifact_types, :location, :boolean
  end
end
