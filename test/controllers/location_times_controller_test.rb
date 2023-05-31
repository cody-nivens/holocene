require "test_helper"

class LocationTimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location_time = location_times(:location_time_1)
    @segment = @location_time.segment
    @user = users(:users_1)
    sign_in @user
  end

  if 1 == 0
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

  test "should not create location_time" do
    assert_difference('LocationTime.count', 0) do
      post segment_location_times_url(@segment), params: { location_time: { date_string: '', location_id: @location_time.location_id, segment_id: @segment.id } }
    end

    assert_response :unprocessable_entity
    assert_template :new
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

  test "should not update location_time" do
    patch location_time_url(@location_time), params: { location_time: { date_string: '', location_id: @location_time.location_id, segment_id: @segment.id } }

    assert_response :unprocessable_entity
    assert_template :edit
  end

  test "should destroy location_time" do
    assert_difference('LocationTime.count', -1) do
      delete location_time_url(@location_time)
    end

    assert_redirected_to stage_url(@segment.stage)
  end
end

  test 'should get edit' do
    get edit_location_time_path(@location_time)
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should get new' do
    get new_polymorphic_path([@segment, :location_time])
    assert_select "turbo-frame", id:  "new_object", target: "edit"
    assert_response :success
  end

  test 'should show location_time TS' do
    get location_time_path(@location_time, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test 'should show location_time index TS' do
    get segment_location_times_url(@segment, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end


  test "should create location_time TS" do
    assert_difference('LocationTime.count') do
      post segment_location_times_url(@segment, format: :turbo_stream),
        params: { location_time: { date_string: @location_time.date_string, location_id: @location_time.location_id, segment_id: @segment.id } }
    end
    
    assert_no_turbo_stream action: :update, target: "messages"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "edit"
    assert_turbo_stream action: :replace, target: "objects"
    #assert_turbo_stream status: :created, action: :append, target: "messages" do |selected|
    #  assert_equal "<template>message_1</template>", selected.children.to_html
    #end
    assert_response :success
  end

  test "should update location_time TS" do
    patch location_time_url(@location_time, format: :turbo_stream),
      params: { location_time: { date_string: @location_time.date_string, location_id: @location_time.location_id, segment_id: @segment.id } }
    assert_turbo_stream action: :replace, target: "#{dom_id @location_time}"

    assert_no_turbo_stream action: :update, target: "messages"
    assert_response :success
  end

  test "should destroy location time TS" do
    assert_difference('LocationTime.count', -1) do
      delete location_time_url(@location_time, format: :turbo_stream)
    end

    assert_turbo_stream action: :replace, target: "objects"
    assert_response :success
  end
end
