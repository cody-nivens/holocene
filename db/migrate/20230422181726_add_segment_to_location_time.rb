class AddSegmentToLocationTime < ActiveRecord::Migration[6.1]
  def change
    add_column :location_times, :segment_id, :bigint
  end
end
