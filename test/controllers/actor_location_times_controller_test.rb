require "test_helper"

class ActorLocationTimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @actor_location_time = actor_location_times(:actor_location_time_1)
    @location_time = @actor_location_time.location_time
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get location_time_actor_location_times_url(@location_time)
    assert_response :success
  end

  test "should get new" do
    get new_location_time_actor_location_time_url(@location_time)
    assert_response :success
  end

  test "should create actor_location_time" do
    assert_difference('ActorLocationTime.count') do
      post location_time_actor_location_times_url(@actor_location_time), params: { actor_location_time: { actor_id: @actor_location_time.actor_id, location_time_id: @actor_location_time.location_time_id } }
    end

    assert_redirected_to stage_url(ActorLocationTime.last.location_time.segment.stage)
  end

  test "should show actor_location_time" do
    get actor_location_time_url(@actor_location_time)
    assert_response :success
  end

  test "should get edit" do
    get edit_actor_location_time_url(@actor_location_time)
    assert_response :success
  end

  test "should update actor_location_time" do
    patch actor_location_time_url(@actor_location_time), params: { actor_location_time: { actor_id: @actor_location_time.actor_id, location_time_id: @actor_location_time.location_time_id } }
    assert_redirected_to stage_url(@actor_location_time.location_time.segment.stage)
  end

  test "should destroy actor_location_time" do
    assert_difference('ActorLocationTime.count', -1) do
      delete actor_location_time_url(@actor_location_time)
    end

    assert_redirected_to stage_url(@actor_location_time.location_time.segment.stage)
  end
end
