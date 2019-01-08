class CreateEventTypesTimelinesTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :event_types,:timelines do |t|
      t.index [:event_type_id, :timeline_id], :name => 'index_event_type_timeline_1'
      t.index [:timeline_id, :event_type_id], :name => 'index_event_type_timeline_2'
    end
  end
end
