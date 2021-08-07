require 'test_helper'

class StoryTest < ActiveSupport::TestCase
   test "scene count" do
     story = stories(:story_2)
     assert_not_equal 0, story.scene_count
   end
end
