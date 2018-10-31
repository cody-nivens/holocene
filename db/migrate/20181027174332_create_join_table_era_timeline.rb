class CreateJoinTableEraTimeline < ActiveRecord::Migration[5.2]
  def change
    create_join_table :eras, :timelines do |t|
       t.index [:era_id, :timeline_id],  :name => 'index_era_timeline_1'
       t.index [:timeline_id, :era_id],  :name => 'index_era_timeline_2'
    end

  end
end
