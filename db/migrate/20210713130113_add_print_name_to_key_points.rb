class AddPrintNameToKeyPoints < ActiveRecord::Migration[6.0]
  def change
    add_column :key_points, :print_name, :boolean, :default => false
  end
end
