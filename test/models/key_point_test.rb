require 'test_helper'

class KeyPointTest < ActiveSupport::TestCase
  test "set_next 1" do
    key_point = key_points(:key_point_1)
    next_key_point = key_point.set_next

    assert_equal key_points(:key_point_3).hook,next_key_point.hook
  end

  test "set_next 2" do
    key_point = key_points(:key_point_3)
    next_key_point = key_point.set_next

    assert_equal key_points(:key_point_9).hook,next_key_point.hook
  end

  test "set_next 3" do
    key_point = key_points(:key_point_9)
    next_key_point = key_point.set_next

    assert_nil next_key_point
  end

  test "set_prev 1" do
    key_point = key_points(:key_point_9)
    next_key_point = key_point.set_prev

    assert_equal key_points(:key_point_3).hook,next_key_point.hook
  end

  test "set_prev 2" do
    key_point = key_points(:key_point_3)
    next_key_point = key_point.set_prev

    assert_equal key_points(:key_point_1).hook,next_key_point.hook
  end

  test "set_prev 3" do
    key_point = key_points(:key_point_1)
    next_key_point = key_point.set_prev

    assert_nil next_key_point
  end

end
