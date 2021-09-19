# frozen_string_literal: true

require 'test_helper'

class TimelinesGeoMapHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @timeline = timelines(:timeline_1)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should map timeline' do
    get geo_map_timeline_url(id: @timeline.id)
    assert_response :success

    assert_select 'a[text()=?]', 'Timeline'
    assert_select 'a[href=?]', timeline_timeline_path(@timeline)
    assert_select 'a[text()=?]', 'Display'
    assert_select 'a[href=?]', timeline_display_path(@timeline)
    assert_select 'a[text()=?]', 'Back'
    assert_select '.footer>div>a', 3
    assert_template 'timelines/geo_map'
  end
end
