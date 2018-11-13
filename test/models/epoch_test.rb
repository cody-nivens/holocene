require 'test_helper'

class EpochTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "epoch_json_tjs should return json" do
      epoch = epochs(:one)
      assert_not_equal "", epoch.epoch_json_tjs
  end
end
