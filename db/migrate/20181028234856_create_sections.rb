class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.string :name
      t.boolean :display_name
      t.text :body
      t.integer :position
      t.string :slug
      t.integer :chapter_id

      t.timestamps
    end
  end
end
