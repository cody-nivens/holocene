class CreateFootnotes < ActiveRecord::Migration[5.2]
  def change
    create_table :footnotes do |t|
      t.string :slug
      t.text :body
      t.references :noted, polymorphic: true, index: true
      t.references :biblioentry

      t.timestamps
    end
  end
end
