class AddParentIdToArtifact < ActiveRecord::Migration[6.0]
  def change
    add_column :artifacts, :parent_id, :bigint
  end
end
