class ChangeColumnsLocationTime < ActiveRecord::Migration[6.1]
  def change
    rename_column :location_times, :stage_id, :action_id
  end
end
