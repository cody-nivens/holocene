# frozen_string_literal: true

require 'test_helper'

class TimelinesDisplayHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @timeline = timelines(:timeline_1)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should display timeline' do
    get timeline_display_url(timeline_id: @timeline.id)
    assert_response :success

    assert_select 'a[text()=?]', 'Timeline'
    assert_select 'a[href=?]', timeline_timeline_path(@timeline)
    assert_select 'a[text()=?]', 'Map'
    assert_select 'a[href=?]', geo_map_timeline_path(@timeline)
    assert_select 'a[text()=?]', 'Back'
    assert_select '.footer>div>a', 3
    assert_template 'holocene_events/display'
  end
end
