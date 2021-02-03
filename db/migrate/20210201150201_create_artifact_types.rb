class CreateArtifactTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :artifact_types do |t|
      t.string :name
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
