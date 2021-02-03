class CreateArtifactLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :artifact_locations do |t|
      t.references :artifact, null: false, foreign_key: true
      t.references :located, polymorphic: true, null: false

      t.timestamps
    end
  end
end
