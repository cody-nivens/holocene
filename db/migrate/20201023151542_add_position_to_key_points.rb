class AddPositionToKeyPoints < ActiveRecord::Migration[6.0]
  def change
    add_column :key_points, :position, :integer
    add_column :scenes, :position, :integer
  end
end
