# frozen_string_literal: true

require 'test_helper'

class ChapterTest < ActiveSupport::TestCase
  setup do
    @chapter = chapters(:chapter_1)
  end

  test 'set value' do
    values = @chapter.set_values

    book = books(:book_1)

    assert_equal book, values[0]
    assert_equal @chapter, values[1]
  end

  test 'should return json' do
    @chapter.timeline_json
    @chapter.timeline_json(false)
  end

  test 'should see show events flag' do
    assert @chapter.show_events?
  end

  test 'should return citations' do
    assert_equal 1, @chapter.citations.size
  end

  test 'should return footnotes' do
    assert_equal 1, @chapter.footnotes.size
  end
end
