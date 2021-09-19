# frozen_string_literal: true

require 'test_helper'

class KeyPointsEditHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @key_point = key_points(:key_point_1)
    @scripted = @key_point.scripted

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get edit' do
    get edit_key_point_url(@key_point)
    assert_response :success

    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', key_point_path(@key_point)
    assert_select '.footer>div>a', 1
    assert_template 'key_points/edit'
  end
end
