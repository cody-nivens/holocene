require 'test_helper'

class TimelinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @timeline = timelines(:timeline_1)
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get timelines_url
    assert_response :success
  end

  test "should get new" do
    get new_timeline_url
    assert_response :success
  end

  test "should create timeline" do
    assert_difference('Timeline.count') do
        post timelines_url, params: { timeline: { description: @timeline.description, name: @timeline.name, user_id: @user.id } }
    end

    assert_redirected_to timeline_url(Timeline.last)
  end

  test "should not create timeline" do
    assert_difference('Timeline.count', 0) do
      post timelines_url, params: { timeline: { description: @timeline.description, name: "" } }
    end

    assert_response :success
  end

  test "should show timeline" do
      get timeline_url(@timeline)
    assert_response :success

    assert_select "a[text()=?]",'Edit'
    assert_select "a[href=?]", edit_timeline_path(@timeline)
    assert_select "a[text()=?]",'Timeline'
    assert_select "a[href=?]", timeline_timeline_path(@timeline)
    assert_select "a[text()=?]",'Display'
    assert_select "a[href=?]", timeline_display_path(@timeline)
    assert_select "a[text()=?]",'Map'
    assert_select "a[href=?]", geo_map_timeline_path(@timeline)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", timelines_path
    assert_select ".footer>div>a", 5
  end

  test "should map timeline" do
      get geo_map_timeline_url(@timeline)
    assert_response :success
  end

  test "should show timeline timeline" do
      get timeline_timeline_url(:timeline_id => @timeline.id)
    assert_response :success
  end

  test "should show timeline events" do
      get timeline_display_url(@timeline)
    assert_response :success
  end

  test "should get edit" do
    get edit_timeline_url(@timeline)
    assert_response :success
  end

  test "should update timeline" do
      patch timeline_url(@timeline), params: { timeline: { description: @timeline.description, name: @timeline.name, user_id: @user.id } }
    assert_redirected_to timeline_url(@timeline)
  end

  test "should not update timeline" do
    patch timeline_url(@timeline), params: { timeline: { description: @timeline.description, name: "" } }
    assert_response :success
  end
  test "should destroy timeline" do
    assert_difference('Timeline.count', -1) do
      delete timeline_url(@timeline)
    end

    assert_redirected_to timelines_url
  end
end
