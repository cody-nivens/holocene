class CreateJoinTableHoloceneEventsSections < ActiveRecord::Migration[5.2]
  def change
    create_join_table :holocene_events, :sections do |t|
       t.index [:holocene_event_id, :section_id], :name => 'index_holocene_event_section_1'
       t.index [:section_id, :holocene_event_id], :name => 'index_holocene_event_section_2'
    end
  end
end
