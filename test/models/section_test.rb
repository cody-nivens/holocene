# frozen_string_literal: true

require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  test 'set value' do
    section = sections(:section_1)
    values = section.set_values

    story = stories(:story_1)
    book = books(:book_1)
    chapter = chapters(:chapter_1)
    scene = scenes(:scene_1)
    key_point = key_points(:key_point_1)

    assert_equal book, values[0]
    assert_equal chapter, values[1]
    assert_equal section, values[2]
    assert_nil   values[3]
    assert_nil   values[4]

    section = sections(:section_11)
    values = section.set_values

    assert_equal story, values[1]
    assert_equal key_point, values[2]
    assert_equal scene, values[3]
    assert_equal section, values[4]
  end

  test 'word counts' do
    section = sections(:section_13)
    assert_equal 8, section.word_count
  end
end
