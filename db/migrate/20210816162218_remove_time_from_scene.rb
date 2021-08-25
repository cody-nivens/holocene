class RemoveTimeFromScene < ActiveRecord::Migration[6.0]
  def change
    remove_column :scenes, :time
  end
end
