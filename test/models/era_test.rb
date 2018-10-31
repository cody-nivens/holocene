require 'test_helper'

class EraTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "era_json_tjs should return json" do
      era = eras(:one)
      assert_not_equal "", era.era_json_tjs
  end
end
