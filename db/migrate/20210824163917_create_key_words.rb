class CreateKeyWords < ActiveRecord::Migration[6.0]
  def change
    create_table :key_words do |t|
      t.string :key_word
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
