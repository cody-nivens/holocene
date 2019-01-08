class RemoveImageHoloceneEvent < ActiveRecord::Migration[5.2]
  def change
      remove_column :holocene_events, :image
  end
end
