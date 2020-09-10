class CreateCharacterAttributes < ActiveRecord::Migration[6.0]
  def change
    create_table :character_attributes do |t|
      t.string :name
      t.references :character_category, null: false, foreign_key: true
      t.integer :related_id

      t.timestamps
    end
  end
end
