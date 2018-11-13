class CreateJoinTableEpochTimeline < ActiveRecord::Migration[5.2]
  def change
    create_join_table :epochs, :timelines do |t|
       t.index [:epoch_id, :timeline_id],  :name => 'index_epoch_timeline_1'
       t.index [:timeline_id, :epoch_id],  :name => 'index_epoch_timeline_2'
    end

  end
end
