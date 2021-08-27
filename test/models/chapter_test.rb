require 'test_helper'

class ChapterTest < ActiveSupport::TestCase
  test "set value" do
    chapter = chapters(:chapter_1)
    values = chapter.set_values

    book = books(:book_1)

    assert_equal book, values[0]
    assert_equal chapter, values[1]
  end
end
