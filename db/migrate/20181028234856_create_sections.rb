class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.string :name
      t.text :body
      t.integer :rank
      t.integer :chapter_id

      t.timestamps
    end
  end
end
