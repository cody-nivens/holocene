# frozen_string_literal: true

require 'test_helper'

class ScenesEditHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @scene = scenes(:scene_1)
    @key_point = @scene.key_point

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get edit' do
    get edit_scene_url(@scene)
    assert_response :success

    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', scene_path(@scene)
    assert_template 'scenes/edit'
  end
end
