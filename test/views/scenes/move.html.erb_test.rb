require 'test_helper'

class ScenesMoveHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @scene = scenes(:scene_1)
    @key_point = @scene.key_point

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get move' do
    get scene_move_url(@scene)

    assert_response 200

    assert_template 'scenes/move'

    assert_select 'h1', 'Move scene A00001: Missing stormy 1 scene'

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
