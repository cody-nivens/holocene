require "test_helper"

class LocationTimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location_time = location_times(:location_time_1)
    @segment = @location_time.segment
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get segment_location_times_url(@segment)
    assert_response :success
  end

  test "should get new" do
    get new_segment_location_time_url(@segment)
    assert_response :success
  end

  test "should create location_time" do
    assert_difference('LocationTime.count') do
      post segment_location_times_url(@segment), params: { location_time: { date_string: @location_time.date_string, location_id: @location_time.location_id, segment_id: @segment.id } }
    end

    assert_redirected_to stage_url(@segment.stage)
  end

  test "should show location_time" do
    get location_time_url(@location_time)
    assert_response :success
  end

  test "should get edit" do
    get edit_location_time_url(@location_time)
    assert_response :success
  end

  test "should update location_time" do
    patch location_time_url(@location_time), params: { location_time: { date_string: @location_time.date_string, location_id: @location_time.location_id, segment_id: @segment.id } }
    assert_redirected_to stage_url(@location_time.segment.stage)
  end

  test "should destroy location_time" do
    assert_difference('LocationTime.count', -1) do
      delete location_time_url(@location_time)
    end

    assert_redirected_to stage_url(@segment.stage)
  end
end
