require 'test_helper'

class StoryTest < ActiveSupport::TestCase
  test "set value" do
    story = stories(:story_1)
    values = story.set_values

    book = books(:book_2)
    assert_equal book, values[0]
    assert_equal story, values[1]
  end

   test "scene count" do
     story = stories(:story_2)
     assert_not_equal 0, story.scene_count
   end
end
