class AlterPartitionBodyToText < ActiveRecord::Migration[5.2]
  def change
    change_column :partitions,:body,:text
  end
end
