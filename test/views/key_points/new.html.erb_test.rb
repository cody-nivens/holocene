# frozen_string_literal: true

require 'test_helper'

class KeyPointsNewHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @key_point = key_points(:key_point_1)
    @scripted = @key_point.scripted

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get new' do
    get new_polymorphic_url([@scripted, :key_point])
    assert_response :success

    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', polymorphic_path([@scripted, :key_points])
    assert_template 'key_points/new'
  end
end
