# frozen_string_literal: true

require 'test_helper'

class CharacterScenesEditHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @character_scene = character_scenes(:character_scene_1)
    @character = @character_scene.character
    @scene = @character_scene.scene

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get edit' do
    get edit_character_scene_url(@character_scene)
    assert_response :success

    assert_select 'a[text()=?]', 'Show'
    assert_select 'a[href=?]', character_scene_path(@character_scene)
    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', scene_path(@scene)
    assert_select '.footer>div>a', 2
    assert_template 'character_scenes/edit'
  end
end
