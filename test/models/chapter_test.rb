require 'test_helper'

class ChapterTest < ActiveSupport::TestCase
  test "set value" do
    chapter = chapters(:chapter_1)
    values = chapter.set_values

    book = books(:book_1)

    assert_equal book, values[0]
    assert_equal chapter, values[1]
  end

  test "should return json" do
    chapter = chapters(:chapter_1)
    chapter.timeline_json
    chapter.timeline_json(false)
  end

  test "should see show events flag" do
    chapter = chapters(:chapter_1)
    assert_equal true,chapter.show_events?
  end
end
