class CreatePlotPointScenes < ActiveRecord::Migration[6.1]
  def change
    create_table :plot_point_scenes do |t|
      t.bigint :scene_id
      t.bigint :plot_point_id

      t.timestamps
    end
  end
end
