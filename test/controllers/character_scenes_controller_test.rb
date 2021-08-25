require 'test_helper'

class CharacterScenesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @character_scene = character_scenes(:character_scene_1)
    @scene = @character_scene.scene
    @character = @character_scene.character
    @user = users(:users_1)
    sign_in @user
  end

  test "should get edit" do
    get edit_polymorphic_url([@scene, @character_scene])
    assert_response :success
  end

  test "should update character_scene" do
    patch polymorphic_url([@scene, @character_scene]), params: { character_scene: { :character_id => @character_scene.character.id, :scene_id => @scene.id}}
    assert_redirected_to polymorphic_url([@scene.situated, @scene])
  end

  test "should not update character_scene" do
    patch polymorphic_url([@scene, @character_scene]), params: { character_scene: { :character_id => nil, :scene_id => @scene.id}}
    assert_response :success
  end
end
