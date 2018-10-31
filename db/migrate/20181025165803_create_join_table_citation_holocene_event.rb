class CreateJoinTableCitationHoloceneEvent < ActiveRecord::Migration[5.2]
  def change
    create_join_table :citations, :holocene_events do |t|
       t.index [:citation_id, :holocene_event_id],  :name => 'index_citation_holocene_event_1'
       t.index [:holocene_event_id, :citation_id],  :name => 'index_citation_holocene_event_2'
    end
  end
end
