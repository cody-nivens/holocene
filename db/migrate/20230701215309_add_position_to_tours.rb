class AddPositionToTours < ActiveRecord::Migration[7.0]
  def change
    add_column :tours, :position, :integer
    add_column :segments, :position, :integer
  end
end
