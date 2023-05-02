class AddSceneToSegment < ActiveRecord::Migration[6.1]
  def change
    add_column :segments, :scene_id, :bigint
  end
end
