# frozen_string_literal: true

require 'test_helper'

class TimelinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @timeline = timelines(:timeline_1)
    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get timelines_url
    assert_response :success
  end

  test 'should get new' do
    get new_timeline_url
    assert_response :success
  end

  test 'should create timeline' do
    assert_difference('Timeline.count') do
      post timelines_url,
           params: { timeline: { description: @timeline.description, name: @timeline.name, user_id: @user.id } }
    end

    assert_redirected_to timeline_url(Timeline.last)
  end

  test 'should not create timeline' do
    assert_difference('Timeline.count', 0) do
      post timelines_url, params: { timeline: { description: @timeline.description, name: '' } }
    end

    assert_response :success
  end

  test 'should show timeline' do
    get timeline_url(@timeline)
    assert_response :success
  end

  test 'should map timeline' do
    get geo_map_timeline_url(@timeline)
    assert_response :success
  end

  test 'should show timeline timeline' do
    get timeline_timeline_url(timeline_id: @timeline.id)
    assert_response :success
  end

  test 'should show timeline events' do
    get timeline_display_url(@timeline)
    assert_response :success
  end

  test 'should get edit' do
    get edit_timeline_url(@timeline)
    assert_response :success
  end

  test 'should update timeline' do
    patch timeline_url(@timeline),
          params: { timeline: { description: @timeline.description, name: @timeline.name, user_id: @user.id } }
    assert_redirected_to timeline_url(@timeline)
  end

  test 'should not update timeline' do
    patch timeline_url(@timeline), params: { timeline: { description: @timeline.description, name: '' } }
    assert_response :success
  end
  test 'should destroy timeline' do
    assert_difference('Timeline.count', -1) do
      delete timeline_url(@timeline)
    end

    assert_redirected_to timelines_url
  end
end
