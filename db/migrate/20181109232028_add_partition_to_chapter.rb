class AddPartitionToChapter < ActiveRecord::Migration[5.2]
  def change
      add_column :chapters, :partition, :string
      add_column :chapters, :partition_body, :text
  end
end
