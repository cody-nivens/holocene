class CreateChapters < ActiveRecord::Migration[5.2]
  def change
    create_table :chapters do |t|
      t.string :name
      t.text :body
      t.integer :position
      t.string :slug

      t.timestamps
    end
  end
end
