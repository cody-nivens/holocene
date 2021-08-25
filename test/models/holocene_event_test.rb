require 'test_helper'

class HoloceneEventTest < ActiveSupport::TestCase
  test "slide should return json" do
      holocene_event = holocene_events(:holocene_event_1)
      assert_not_equal "", holocene_event.slide
  end

  test "set value" do
    holocene_event = holocene_events(:holocene_event_1)
    values = holocene_event.set_values

    chapter = chapters(:chapter_1)
    book = books(:book_1)
    assert_equal book, values[0]
    assert_equal chapter, values[1]
    assert_equal holocene_event, values[2]
  end
end
