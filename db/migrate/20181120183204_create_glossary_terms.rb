class CreateGlossaryTerms < ActiveRecord::Migration[5.2]
  def change
    create_table :glossary_terms do |t|
      t.string :name
      t.text :body
      t.integer :see_id, :null => true
      t.integer :seealso_id, :null => true
      t.integer :acronym_id, :null => true
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
  end
end
