class AddArtifactTypeToArtifact < ActiveRecord::Migration[6.0]
  def change
    add_reference :artifacts, :artifact_type, null: false, foreign_key: true
  end
end
