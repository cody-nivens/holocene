class MigratePartitionBodyToActionText < ActiveRecord::Migration[6.0]
    include ActionView::Helpers::TextHelper
  def change
    rename_column :partitions, :body, :body_old
    Partition.all.each do |partition|
      partition.update_attribute(:body, simple_format(partition.body_old, {}, wrapper_tag: "div"))
    end
    remove_column :partitions, :body_old
  end
end
