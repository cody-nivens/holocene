class AddMissingIndexes < ActiveRecord::Migration[6.0]
  def change
add_index :artifacts, :parent_id
add_index :asides, :chapter_id
add_index :authors, :user_id
add_index :biblioentries, :user_id
add_index :biblioentries, :book_id
add_index :books, :user_id
add_index :character_attributes, :related_id
add_index :characters, :father_id
add_index :epochs, :user_id
add_index :event_types, :user_id
add_index :glossary_terms, :see_id
add_index :glossary_terms, :seealso_id
add_index :glossary_terms, :acronym_id
add_index :glossary_terms, :user_id
add_index :glossary_terms, :book_id
add_index :holocene_events, :user_id
add_index :partitions, :chapter_id
add_index :regions, :user_id
add_index :scenes, :key_point_id
add_index :scenes, :section_id
add_index :scenes, :insert_scene_id
add_index :scenes, :artifact_id
add_index :sections, :chapter_id
add_index :signets, [ :sigged_id, :sigged_type ]
add_index :stories, :book_id
add_index :timelines, :user_id
  end
end
