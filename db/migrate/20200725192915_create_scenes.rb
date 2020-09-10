class CreateScenes < ActiveRecord::Migration[6.0]
  def change
    create_table :scenes do |t|
      t.string :abc
      t.boolean :check
      t.string :time
      t.integer :scene_sequel

      t.timestamps
    end
  end
end
