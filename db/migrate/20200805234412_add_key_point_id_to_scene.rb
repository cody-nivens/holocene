class AddKeyPointIdToScene < ActiveRecord::Migration[6.0]
  def change
    add_column :scenes, :key_point_id, :integer
  end
end
