require "test_helper"

class SegmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @segment = segments(:segment_1)
    @stage = @segment.stage
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get stage_segments_url(@stage)
    assert_response :success
  end

  test "should get new" do
    get new_stage_segment_url(@stage)
    assert_response :success
  end

  test "should create segment" do
    assert_difference('Segment.count') do
      post stage_segments_url(@stage), params: { segment: { name: "Test 1", stage_id: @segment.stage_id } }
    end

    assert_redirected_to segment_url(Segment.last)
  end

  test "should show segment" do
    get segment_url(@segment)
    assert_response :success
  end

  test "should get edit" do
    get edit_segment_url(@segment)
    assert_response :success
  end

  test "should update segment" do
    patch segment_url(@segment), params: { segment: { name: "Test 2", stage_id: @segment.stage_id } }
    assert_redirected_to segment_url(@segment)
  end

  test "should destroy segment" do
    assert_difference('Segment.count', -1) do
      delete segment_url(@segment)
    end

    assert_redirected_to stage_segments_url(@stage)
  end
end
