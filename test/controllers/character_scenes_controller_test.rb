require 'test_helper'

class CharacterScenesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @character_scene = character_scenes(:character_scene_1)
    @scene = @character_scene.scene
    @character = @character_scene.character
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get polymorphic_url([@scene, 'character_scenes'])
    assert_response :success
  end

  test "should get new" do
    get new_polymorphic_url([@scene, 'character_scene']), params: { character_id: @character.id}
    assert_response :success
  end

  test "should create character_scene" do
    assert_difference('CharacterScene.count') do
      post polymorphic_url([@scene, 'character_scenes']), params: { character_scene: { :character_id => @character_scene.character.id, :scene_id => @scene.id}}
    end

    assert_redirected_to polymorphic_url([@scene.situated, @scene.key_point])
  end

  test "should not create character_scene" do
    assert_difference('CharacterScene.count', 0) do
      post polymorphic_url([@scene, 'character_scenes']), params: { character_scene: { :character_id => nil, :scene_id => @scene.id}}
    end

    assert_response :success
  end

  test "should show character_scene" do
    get polymorphic_url([@scene, @character_scene])
    assert_response :success
  end

  test "should get edit" do
    get edit_polymorphic_url([@scene, @character_scene])
    assert_response :success
  end

  test "should update character_scene" do
    patch polymorphic_url([@scene, @character_scene]), params: { character_scene: { :character_id => @character_scene.character.id, :scene_id => @scene.id}}
    assert_redirected_to polymorphic_url([@scene.situated, @scene.key_point])
  end

  test "should not update character_scene" do
    patch polymorphic_url([@scene, @character_scene]), params: { character_scene: { :character_id => nil, :scene_id => @scene.id}}
    assert_response :success
  end

  test "should destroy character_scene" do
    assert_difference('CharacterScene.count', -1) do
      delete polymorphic_url([@scene,@character_scene])
    end

    assert_redirected_to polymorphic_url([@scene, 'character_scenes'])
  end
end
