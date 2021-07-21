require 'test_helper'

class EpochTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "timeline_json should return json" do
      epoch = epochs(:epoch_1)
      assert_not_equal "", epoch.timeline_json("off")
  end
end
