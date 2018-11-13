class CreateJoinTableChaptersCitations < ActiveRecord::Migration[5.2]
  def change
    create_join_table :chapters, :citations do |t|
       t.index [:chapter_id, :citation_id], :name => 'index_chapter_citation_1'
       t.index [:citation_id, :chapter_id], :name => 'index_chapter_citation_2'
    end
  end
end
