# frozen_string_literal: true

require 'test_helper'

class ScenesIndexHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @scene = scenes(:scene_1)
    @key_point = @scene.key_point
    @situated = @key_point.scripted

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get key_point_scenes_url(key_point_id: @key_point.id)

    assert_response 200
    @scenes = Scene.all

    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', polymorphic_path(@key_point)
    assert_select '.footer>div>a', 2
    assert_template 'scenes/index'

    assert_select 'h1', "Scenes for #{@situated.name}"

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
