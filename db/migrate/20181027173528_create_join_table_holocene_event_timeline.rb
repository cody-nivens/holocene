class CreateJoinTableHoloceneEventTimeline < ActiveRecord::Migration[5.2]
  def change
    create_join_table :holocene_events, :timelines  do |t|
       t.index [:timeline_id, :holocene_event_id],  :name => 'index_timeline_holocene_event_1'
       t.index [:holocene_event_id, :timeline_id],  :name => 'index_timeline_holocene_event_2'
    end

  end
end
