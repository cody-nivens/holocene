class DropLocationFromAction < ActiveRecord::Migration[6.1]
  def change
    remove_column :actions, :location_id
  end
end
