class CreateJoinTableEventTypeHoloceneEvent < ActiveRecord::Migration[5.2]
  def change
    create_join_table :event_types, :holocene_events do |t|
       t.index [:event_type_id, :holocene_event_id], :name => 'index_event_type_holocene_event_1'
       t.index [:holocene_event_id, :event_type_id], :name => 'index_event_type_holocene_event_2'
    end
  end
end
