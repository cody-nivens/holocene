class CreateCharacterValues < ActiveRecord::Migration[6.0]
  def change
    create_table :character_values do |t|
      t.references :character, null: false, foreign_key: true
      t.references :character_attribute, null: false, foreign_key: true
      t.string :value

      t.timestamps
    end
  end
end
