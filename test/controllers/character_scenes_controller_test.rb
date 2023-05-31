# frozen_string_literal: true

require 'test_helper'

class CharacterScenesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @character_scene = character_scenes(:character_scene_1)
    @scene = @character_scene.scene
    @character = @character_scene.character
    @user = users(:users_1)
    sign_in @user
  end

  if 1 == 0
  test 'should get edit' do
    get edit_character_scene_url(@character_scene)
    assert_response :success
  end

  test 'should update character_scene' do
    patch character_scene_url(@character_scene),
          params: { character_scene: { character_id: @character_scene.character.id, scene_id: @scene.id } }
    assert_redirected_to scene_url(@scene)
  end
end

  test 'should get edit' do
    get edit_polymorphic_path(@character_scene)
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test "should update character_scene TS" do
    patch  polymorphic_path([@book, @character_scene], format: :turbo_stream),
          params: { character_scene: { character_id: @character_scene.character.id, scene_id: @scene.id } }
    assert_turbo_stream action: :replace, target: "#{dom_id @character_scene}"

    assert_no_turbo_stream action: :update, target: "messages"
    assert_response :success
  end

end

