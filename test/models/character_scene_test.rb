# frozen_string_literal: true

require 'test_helper'

class CharacterSceneTest < ActiveSupport::TestCase
  test 'set value' do
    character_scene = CharacterScene.first
    values = character_scene.set_values

    book = books(:book_2)
    story = stories(:story_2)
    key_point = key_points(:key_point_2)
    scene = scenes(:scene_2)
    assert_equal book, values[0]
    assert_equal story, values[1]
    assert_equal key_point, values[2]
    assert_equal scene, values[3]
  end

  test 'the name' do
    character_scene = character_scenes(:character_scene_1)

    character = characters(:character_1)
    scene = scenes(:scene_2)

    assert_equal character, character_scene.character
    assert_equal scene, character_scene.scene
    assert_equal "#{character.name}-#{scene.name}", character_scene.name
  end
end
