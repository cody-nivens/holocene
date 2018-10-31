require 'test_helper'

class TimelineTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "timeline_json should return json" do
      timeline = timelines(:one)
      assert_not_equal "", timeline.timeline_json
  end
end
