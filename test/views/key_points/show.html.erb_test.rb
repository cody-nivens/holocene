# frozen_string_literal: true

require 'test_helper'

class KeyPointsShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @key_point = key_points(:key_point_1)
    @scripted = @key_point.scripted

    @user = users(:users_1)
    sign_in @user
  end

  test 'should show key_point' do
    get key_point_path(@key_point)
    assert_response :success

    assert_select 'a[href=?]', edit_key_point_path(@key_point)

    assert_select 'a[text()=?]', 'Move'
    assert_select 'a[href=?]', polymorphic_path([@scripted, @key_point, :move])
    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', polymorphic_path([@scripted], anchor: @key_point.anchor)
    assert_select '.footer>div>a', 2
    assert_template 'key_points/show'
  end
end
