require 'test_helper'

class KeyPointTest < ActiveSupport::TestCase
  test "set value" do
    key_point = key_points(:key_point_1)
    values = key_point.set_values

    story = stories(:story_1)
    book = books(:book_2)
    assert_equal book, values[0]
    assert_equal story, values[1]
    assert_equal key_point, values[2]
  end

  test "scene_count" do
    key_point = key_points(:key_point_1)
    assert_not_equal 0, key_point.scene_count
  end

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
