class CreateCitations < ActiveRecord::Migration[5.2]
  def change
    create_table :citations do |t|
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
