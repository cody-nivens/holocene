class CreateJoinTableAuthorBiblioentry < ActiveRecord::Migration[5.2]
  def change
    create_join_table :authors, :biblioentries do |t|
       t.index [:author_id, :biblioentry_id],  :name => 'index_author_biblioentry_1'
       t.index [:biblioentry_id, :author_id],  :name => 'index_author_biblioentry_2'
    end
  end
end
