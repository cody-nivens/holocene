# frozen_string_literal: true

require 'test_helper'

class TimelinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @timeline = timelines(:timeline_1)
    @user = users(:users_1)
    sign_in @user
  end

  if 1 ==0
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

  test 'should get edit' do
    get edit_timeline_path(@timeline)
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should get new' do
    get new_timeline_path
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should show timeline TS' do
    get timeline_path(@timeline, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test 'should show timeline index TS' do
    get timelines_url(format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end


  test "should create timeline TS" do
    assert_difference('Timeline.count') do
      post timelines_url(format: 'turbo_stream'),
           params: { timeline: { description: @timeline.description, name: @timeline.name, user_id: @user.id } }
    end
    
    assert_no_turbo_stream action: :update, target: "messages"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "objects"
    #assert_turbo_stream status: :created, action: :append, target: "messages" do |selected|
    #  assert_equal "<template>message_1</template>", selected.children.to_html
    #end
    assert_response :success
  end

  test "should update timeline TS" do
    patch  timeline_path(@timeline, format: :turbo_stream),
          params: { timeline: { description: @timeline.description, name: @timeline.name, user_id: @user.id } }
    assert_turbo_stream action: :replace, target: "objects"

    assert_no_turbo_stream action: :update, target: "messages"
    assert_response :success
  end

  test "should destroy timeline TS" do
    assert_difference('Timeline.count', -1) do
      delete timeline_url(@timeline, format: :turbo_stream)
    end

    assert_turbo_stream action: :replace, target: "objects"
    assert_response :success
  end
end
