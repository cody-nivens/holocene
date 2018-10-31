class CreateJoinTableChaptersHoloceneEvents < ActiveRecord::Migration[5.2]
  def change
    create_join_table :chapters, :holocene_events do |t|
       t.index [:chapter_id, :holocene_event_id],  :name => 'index_chapter_holocene_event_1'
       t.index [:holocene_event_id, :chapter_id],  :name => 'index_chapter_holocene_event_2'
    end
  end
end
