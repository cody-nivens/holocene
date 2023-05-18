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

   test 'should check scene' do
    checked = @actor_location_time.check

    put actor_location_times_check_path(id: @actor_location_time.id), xhr: true,
                                               params: { check: !checked }
    assert_response :success
    assert_equal !checked, @actor_location_time.reload.check
  end

  test "should create actor_location_time" do
    assert_difference('ActorLocationTime.count') do
      post location_time_actor_location_times_url(@actor_location_time), params: { date_string: '100', actor_location_time: { actor_id: @actor_location_time.actor_id, location_time_id: @actor_location_time.location_time.id } }
    end

    assert_redirected_to stage_url(ActorLocationTime.last.location_time.segment.stage)
  end

  test "should not create actor_location_time" do
    assert_difference('ActorLocationTime.count', 0) do
      post location_time_actor_location_times_url(@actor_location_time), params: { date_string: "100", actor_location_time: { actor_id: nil, location_time_id: @actor_location_time.location_time.id } }
    end

    assert_response :unprocessable_entity
    assert_template :new
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
    patch actor_location_time_url(@actor_location_time), params: { date_string: '100', actor_location_time: { actor_id: @actor_location_time.actor_id, location_time_id: @actor_location_time.location_time.id } }
    assert_redirected_to stage_url(@actor_location_time.location_time.segment.stage)
  end

  test "should not update actor_location_time" do
    patch actor_location_time_url(@actor_location_time), params: { date_string: "100", actor_location_time: { actor_id: nil, location_time_id: @actor_location_time.location_time.id } }

    assert_response :unprocessable_entity
    assert_template :edit
  end

  test "should destroy actor_location_time" do
    assert_difference('ActorLocationTime.count', -1) do
      delete actor_location_time_url(@actor_location_time)
    end

    assert_redirected_to stage_url(@actor_location_time.location_time.segment.stage)
  end
end
