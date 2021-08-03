require 'test_helper'


class SceneTest < ActiveSupport::TestCase
  test "set_next 1" do
    scene = scenes(:scene_6)
    next_scene = scene.set_next

    assert_equal "A00002", next_scene.abc
  end

  test "set_next 2" do
    scene = scenes(:scene_2)
    next_scene = scene.set_next

    assert_equal "A00003", next_scene.abc
  end

  test "set_next 3" do
    scene = scenes(:scene_3)
    next_scene = scene.set_next

    assert_nil next_scene
  end

  test "set_prev 1" do
    scene = scenes(:scene_3)
    prev_scene = scene.set_prev

    assert_equal "A00002", prev_scene.abc
  end

  test "set_prev 2" do
    scene = scenes(:scene_2)
    prev_scene = scene.set_prev

    assert_equal "A00004", prev_scene.abc
  end

  test "set_prev 3" do
    scene = scenes(:scene_4)
    prev_scene = scene.set_prev

    assert_nil prev_scene
  end
end
