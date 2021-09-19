# frozen_string_literal: true

require 'test_helper'

class TimelinesTimelineHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @timeline = timelines(:timeline_1)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should map timeline' do
    get timeline_timeline_url(timeline_id: @timeline.id)
    assert_response :success

    assert_select 'a[text()=?]', 'Display'
    assert_select 'a[href=?]', timeline_display_path(@timeline)
    assert_select 'a[text()=?]', 'Back'
    assert_select '.footer>div>a', 2
    assert_template 'timelines/timeline'
  end
end
