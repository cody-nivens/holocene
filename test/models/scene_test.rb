# frozen_string_literal: true

require 'test_helper'

class SceneTest < ActiveSupport::TestCase
  setup do
    @book = books(:book_2)
    @story = stories(:story_1)
    @key_point = key_points(:key_point_1)
    @scene = scenes(:scene_1)
  end

  test 'set value' do
    values = @scene.set_values

    assert_equal @book, values[0]
    assert_equal @story, values[1]
    assert_equal @key_point, values[2]
    assert_equal @scene, values[3]
  end

  test 'should count the scenes after new' do
    scenes = Scene.get_scenes_to_array(@scene.situated, force: true)
    assert_equal 6, scenes.length
    scene = Scene.new({ key_point_id: @scene.key_point.id, situated_type: @scene.situated.class.name, situated_id: @scene.situated.id,
                                                                     abc: @scene.abc, artifact_id: nil, check: @scene.check, scene_sequel: @scene.scene_sequel,
                                                                     date_string: @scene.date_string, book_id: @scene.book_id })
    scene.save
    scenes = Scene.get_scenes_to_array(scene.situated, force: true)
    assert_equal @scene.situated, scene.situated
    assert_equal 7, scenes.length
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
