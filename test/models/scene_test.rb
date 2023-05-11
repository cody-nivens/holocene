# frozen_string_literal: true

require 'test_helper'

class SceneTest < ActiveSupport::TestCase
  test 'set value' do
    scene = scenes(:scene_1)
    values = scene.set_values

    key_point = key_points(:key_point_1)
    story = stories(:story_1)
    book = books(:book_2)
    assert_equal book, values[0]
    assert_equal story, values[1]
    assert_equal key_point, values[2]
    assert_equal scene, values[3]
  end

  test 'should count the scenes' do
    scenes = Scene.get_scenes(books(:book_2))
    assert_equal 2, scenes.keys.length
  end

  test 'should count the scenes 2' do
    scenes = Scene.get_scenes(books(:book_2), 100)
    assert_equal 1, scenes.keys.length
  end

  test 'set_next 1' do
    scene = scenes(:scene_6)
    next_scene = scene.set_next

    assert_equal 'A00002', next_scene.abc

    scene = scenes(:scene_6)
    next_scene = scene.set_next

    assert_equal 'A00002', next_scene.abc

    scene = scenes(:scene_3)
    next_scene = scene.set_next

    assert_nil next_scene
  end

  test 'set_next 4' do
    scene = scenes(:scene_1)
    next_scene = scene.set_next

    assert_equal 'A00011', next_scene.abc
  end

  test 'set_prev 1' do
    scene = scenes(:scene_3)
    prev_scene = scene.set_prev

    assert_equal 'A00004', prev_scene.abc

    scene = scenes(:scene_2)
    prev_scene = scene.set_prev

    assert_equal 'A00004', prev_scene.abc

    scene = scenes(:scene_4)
    prev_scene = scene.set_prev

    assert_nil prev_scene
  end
end
