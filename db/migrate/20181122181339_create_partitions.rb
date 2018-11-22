class CreatePartitions < ActiveRecord::Migration[5.2]
  def change
    create_table :partitions do |t|
      t.string :name
      t.string :body
      t.integer :chapter_id

      t.timestamps
    end
  end
end
