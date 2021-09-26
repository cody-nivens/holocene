# frozen_string_literal: true

require 'test_helper'

class ScenesShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @scene = scenes(:scene_1)
    @key_point = @scene.key_point

    @user = users(:users_1)
    sign_in @user
  end

  test 'should show scene' do
    get scene_path(@scene)
    assert_response :success

    assert_select 'a[href=?]', edit_scene_path(@scene)
    assert_select 'a[href=?]', key_point_path(@key_point)

    assert_select 'a[text()=?]', 'Edit Section'
    assert_select 'a[href=?]', edit_section_path(@scene.section)
    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', polymorphic_path(@scene.situated)
    assert_select 'a[text()=?]', 'Characters'
    assert_select 'a[href=?]', polymorphic_path([@scene, :characters])
    assert_select 'a[text()=?]', 'Move'
    assert_select 'a[href=?]', polymorphic_path([@scene, :move])
    assert_select 'a[text()=?]', 'Destroy'
    assert_select 'a[href=?]', scene_path(@scene), method: :delete, data: { confirm: 'Are you sure?' }


    assert_select '.footer>div>a', 6
    assert_template 'scenes/show'
  end
end
