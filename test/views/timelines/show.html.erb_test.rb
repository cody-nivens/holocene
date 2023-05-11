# frozen_string_literal: true

require 'test_helper'

class TimelinesShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @timeline = timelines(:timeline_1)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should show timeline' do
    get timeline_path(@timeline)
    assert_response :success

    assert_select 'a[title=?]', 'Edit'
    assert_select 'a[href=?]', edit_timeline_path(@timeline)
    assert_select 'a[title=?]', 'Timeline'
    assert_select 'a[href=?]', timeline_timeline_path(@timeline)
    assert_select 'a[title=?]', 'Display'
    assert_select 'a[href=?]', timeline_display_path(@timeline)
    assert_select 'a[title=?]', 'Map'
    assert_select 'a[href=?]', geo_map_timeline_path(@timeline)
    assert_select 'a[title=?]', 'Back'
    assert_template 'timelines/show'
  end
end
