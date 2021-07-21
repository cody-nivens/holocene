class AddPrintPointsToKeyPoint < ActiveRecord::Migration[6.0]
  def change
    add_column :key_points, :print_points, :boolean, :default => false
  end
end
