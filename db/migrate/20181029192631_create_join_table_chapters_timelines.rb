class CreateJoinTableChaptersTimelines < ActiveRecord::Migration[5.2]
  def change
    create_join_table :chapters, :timelines do |t|
       t.index [:chapter_id, :timeline_id],  :name => 'index_chapter_timeline_1'
       t.index [:timeline_id, :chapter_id],  :name => 'index_chapter_timeline_2'
    end
  end
end
