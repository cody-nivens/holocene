# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_03_16_144008) do

  create_table "action_text_rich_texts", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name", null: false
    t.text "body", size: :long
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_admin_comments", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "artifact_types", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "location"
    t.index ["book_id"], name: "index_artifact_types_on_book_id"
  end

  create_table "artifacts", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "character_id", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "artifact_type_id", null: false
    t.bigint "parent_id"
    t.index ["artifact_type_id"], name: "index_artifacts_on_artifact_type_id"
    t.index ["book_id"], name: "index_artifacts_on_book_id"
    t.index ["character_id"], name: "index_artifacts_on_character_id"
    t.index ["parent_id"], name: "index_artifacts_on_parent_id"
  end

  create_table "asides", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "chapter_id"
    t.index ["chapter_id"], name: "index_asides_on_chapter_id"
  end

  create_table "authors", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_authors_on_user_id"
  end

  create_table "authors_biblioentries", id: false, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.bigint "biblioentry_id", null: false
    t.index ["author_id", "biblioentry_id"], name: "index_author_biblioentry_1"
    t.index ["biblioentry_id", "author_id"], name: "index_author_biblioentry_2"
  end

  create_table "authors_books", id: false, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.bigint "book_id", null: false
    t.index ["author_id", "book_id"], name: "index_author_book_1"
    t.index ["book_id", "author_id"], name: "index_author_book_2"
  end

  create_table "biblioentries", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "xreflabel"
    t.string "copyright_year"
    t.string "copyright_holder"
    t.string "publisher"
    t.text "releaseinfo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "book_id"
    t.index ["book_id"], name: "index_biblioentries_on_book_id"
    t.index ["user_id"], name: "index_biblioentries_on_user_id"
  end

  create_table "books", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.boolean "show_events", default: true
    t.string "sub_name"
    t.string "copyright"
    t.boolean "fiction"
    t.string "scene_character"
    t.integer "position"
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "books_characters", id: false, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "character_id", null: false
    t.index ["book_id", "character_id"], name: "index_books_characters_on_book_id_and_character_id", unique: true
  end

  create_table "chapters", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "show_events", default: true
    t.boolean "always_display_events", default: false
    t.string "scripted_type", null: false
    t.bigint "scripted_id", null: false
    t.boolean "display_title", default: true
    t.index ["scripted_type", "scripted_id"], name: "index_chapters_on_scripted_type_and_scripted_id"
  end

  create_table "chapters_characters", id: false, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "chapter_id", null: false
    t.bigint "character_id", null: false
    t.index ["chapter_id", "character_id"], name: "index_chapter_character_1"
    t.index ["character_id", "chapter_id"], name: "index_chapter_character_2"
  end

  create_table "chapters_holocene_events", id: false, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "chapter_id", null: false
    t.bigint "holocene_event_id", null: false
    t.index ["chapter_id", "holocene_event_id"], name: "index_chapter_holocene_event_1"
    t.index ["holocene_event_id", "chapter_id"], name: "index_chapter_holocene_event_2"
  end

  create_table "chapters_timelines", id: false, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "chapter_id", null: false
    t.bigint "timeline_id", null: false
    t.index ["chapter_id", "timeline_id"], name: "index_chapter_timeline_1"
    t.index ["timeline_id", "chapter_id"], name: "index_chapter_timeline_2"
  end

  create_table "character_attributes", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "character_category_id", null: false
    t.integer "related_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "position"
    t.index ["character_category_id"], name: "index_character_attributes_on_character_category_id"
    t.index ["related_id"], name: "index_character_attributes_on_related_id"
  end

  create_table "character_categories", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "position"
  end

  create_table "character_scenes", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "scene_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id", "scene_id"], name: "index_scene_character_1"
    t.index ["scene_id", "character_id"], name: "index_scene_character_2"
  end

  create_table "character_stories", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "story_id", null: false
    t.bigint "character_id", null: false
    t.index ["character_id", "story_id"], name: "index_story_character_2"
    t.index ["story_id", "character_id"], name: "index_story_character_1"
  end

  create_table "character_values", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "character_attribute_id", null: false
    t.string "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_attribute_id"], name: "index_character_values_on_character_attribute_id"
    t.index ["character_id"], name: "index_character_values_on_character_id"
  end

  create_table "characters", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "reason_for_name"
    t.string "nickname"
    t.string "reason_for_nickname"
    t.string "ethnicity"
    t.string "occupation_class"
    t.string "social_class"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "birth_year"
    t.integer "death_year"
    t.integer "father_id"
    t.integer "age_at_son"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "suffix"
    t.string "honorific"
    t.string "grouping"
    t.boolean "use_honorific_only", default: false
    t.bigint "mother_id"
    t.integer "sex", default: 0
    t.boolean "main", default: false
    t.index ["father_id"], name: "index_characters_on_father_id"
    t.index ["mother_id"], name: "index_characters_on_mother_id"
  end

  create_table "cities", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "name_ascii"
    t.decimal "lat", precision: 10, scale: 4
    t.decimal "lng", precision: 10, scale: 4
    t.string "country"
    t.string "iso2"
    t.string "iso3"
    t.string "admin_name"
    t.string "capital"
    t.bigint "population"
    t.bigint "simple_map_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "epochs", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "start_date"
    t.integer "end_date"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_epochs_on_user_id"
  end

  create_table "epochs_timelines", id: false, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "epoch_id", null: false
    t.bigint "timeline_id", null: false
    t.index ["epoch_id", "timeline_id"], name: "index_epoch_timeline_1"
    t.index ["timeline_id", "epoch_id"], name: "index_epoch_timeline_2"
  end

  create_table "event_types", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_event_types_on_user_id"
  end

  create_table "event_types_holocene_events", id: false, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "event_type_id", null: false
    t.bigint "holocene_event_id", null: false
    t.index ["event_type_id", "holocene_event_id"], name: "index_event_type_holocene_event_1"
    t.index ["holocene_event_id", "event_type_id"], name: "index_event_type_holocene_event_2"
  end

  create_table "event_types_timelines", id: false, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "event_type_id", null: false
    t.bigint "timeline_id", null: false
    t.index ["event_type_id", "timeline_id"], name: "index_event_type_timeline_1"
    t.index ["timeline_id", "event_type_id"], name: "index_event_type_timeline_2"
  end

  create_table "footnotes", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "slug"
    t.string "noted_type"
    t.bigint "noted_id"
    t.bigint "biblioentry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["biblioentry_id"], name: "index_footnotes_on_biblioentry_id"
    t.index ["noted_type", "noted_id"], name: "index_footnotes_on_noted_type_and_noted_id"
  end

  create_table "glossary_terms", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.integer "see_id"
    t.integer "seealso_id"
    t.integer "acronym_id"
    t.integer "user_id"
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "term"
    t.index ["acronym_id"], name: "index_glossary_terms_on_acronym_id"
    t.index ["book_id"], name: "index_glossary_terms_on_book_id"
    t.index ["see_id"], name: "index_glossary_terms_on_see_id"
    t.index ["seealso_id"], name: "index_glossary_terms_on_seealso_id"
    t.index ["user_id"], name: "index_glossary_terms_on_user_id"
  end

  create_table "holocene_events", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "start_year"
    t.integer "end_year"
    t.integer "start_year_uncert"
    t.integer "start_year_mod"
    t.integer "end_year_uncert"
    t.integer "end_year_mod"
    t.bigint "region_id"
    t.string "url"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "lng", precision: 10, scale: 6
    t.bigint "related_id"
    t.boolean "related_endpoint", default: false
    t.integer "start_related_offset", default: 0
    t.integer "end_related_offset", default: 0
    t.index ["region_id"], name: "index_holocene_events_on_region_id"
    t.index ["user_id"], name: "index_holocene_events_on_user_id"
  end

  create_table "holocene_events_sections", id: false, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "holocene_event_id", null: false
    t.bigint "section_id", null: false
    t.index ["holocene_event_id", "section_id"], name: "index_holocene_event_section_1"
    t.index ["section_id", "holocene_event_id"], name: "index_holocene_event_section_2"
  end

  create_table "holocene_events_timelines", id: false, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "holocene_event_id", null: false
    t.bigint "timeline_id", null: false
    t.index ["holocene_event_id", "timeline_id"], name: "index_timeline_holocene_event_2"
    t.index ["timeline_id", "holocene_event_id"], name: "index_timeline_holocene_event_1"
  end

  create_table "itineraries", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "tour_id", null: false
    t.bigint "city_id", null: false
    t.integer "position"
    t.integer "stay", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_itineraries_on_city_id"
    t.index ["tour_id"], name: "index_itineraries_on_tour_id"
  end

  create_table "key_points", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.text "hook"
    t.string "inciting_incident"
    t.string "key_element"
    t.string "first_plot_point"
    t.string "first_pinch_point"
    t.string "midpoint"
    t.string "second_pinch_point"
    t.string "third_plot_point"
    t.string "climax"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "scripted_type"
    t.bigint "scripted_id"
    t.integer "position"
    t.boolean "print_name", default: false
    t.boolean "print_points", default: false
    t.index ["scripted_type", "scripted_id"], name: "index_key_points_on_scripted_type_and_scripted_id"
  end

  create_table "key_words", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "key_word"
    t.bigint "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_key_words_on_book_id"
  end

  create_table "metrics", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "count"
    t.datetime "date"
    t.bigint "user_id", null: false
    t.string "metrized_type", null: false
    t.bigint "metrized_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["metrized_type", "metrized_id"], name: "index_metrics_on_metrized_type_and_metrized_id"
    t.index ["user_id"], name: "index_metrics_on_user_id"
  end

  create_table "namers", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.boolean "first_name", default: false
    t.decimal "white", precision: 5, scale: 3
    t.decimal "black", precision: 5, scale: 3
    t.decimal "asian", precision: 5, scale: 3
    t.decimal "indian", precision: 5, scale: 3
    t.decimal "latino_mixed", precision: 5, scale: 3
    t.decimal "latino", precision: 5, scale: 3
    t.string "gender"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "partitions", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "chapter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chapter_id"], name: "index_partitions_on_chapter_id"
  end

  create_table "plot_point_scenes", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "scene_id"
    t.bigint "plot_point_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "plot_points", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "book_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "regions", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_regions_on_user_id"
  end

  create_table "roles", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "scenes", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "abc"
    t.boolean "check"
    t.integer "scene_sequel"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "key_point_id"
    t.string "situated_type", null: false
    t.bigint "situated_id", null: false
    t.integer "position"
    t.integer "selector", default: 0
    t.bigint "section_id"
    t.integer "insert_scene_id"
    t.boolean "before_flag", default: false
    t.bigint "artifact_id"
    t.string "date_string"
    t.boolean "title_scene", default: false
    t.bigint "book_id"
    t.index ["artifact_id"], name: "index_scenes_on_artifact_id"
    t.index ["insert_scene_id"], name: "index_scenes_on_insert_scene_id"
    t.index ["key_point_id"], name: "index_scenes_on_key_point_id"
    t.index ["section_id"], name: "index_scenes_on_section_id"
    t.index ["situated_type", "situated_id"], name: "index_scenes_on_situated_type_and_situated_id"
  end

  create_table "sections", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.boolean "display_name"
    t.integer "position"
    t.string "slug"
    t.integer "chapter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "embed", default: 0
    t.string "sectioned_type", null: false
    t.bigint "sectioned_id", null: false
    t.bigint "user_id", null: false
    t.index ["chapter_id"], name: "index_sections_on_chapter_id"
    t.index ["sectioned_type", "sectioned_id"], name: "index_sections_on_sectioned_type_and_sectioned_id"
    t.index ["user_id"], name: "index_sections_on_user_id"
  end

  create_table "signets", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "color"
    t.string "message"
    t.string "sigged_type"
    t.integer "sigged_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sigged_id", "sigged_type"], name: "index_signets_on_sigged_id_and_sigged_type"
  end

  create_table "stories", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "title"
    t.integer "book_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "position"
    t.string "scene_character"
    t.boolean "publish", default: true
    t.boolean "stand_alone", default: false
    t.boolean "print_summary", default: false
    t.boolean "title_page", default: false
    t.index ["book_id"], name: "index_stories_on_book_id"
  end

  create_table "taggings", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name", collation: "utf8mb3_bin"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "timelines", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_timelines_on_user_id"
  end

  create_table "tours", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "story_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["story_id"], name: "index_tours_on_story_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
