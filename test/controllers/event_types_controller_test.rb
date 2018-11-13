require 'test_helper'

class EventTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_type = event_types(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get event_types_url
    assert_response :success
  end

  test "should get new" do
    get new_event_type_url
    assert_response :success
  end

  test "should create event_type" do
    assert_difference('EventType.count') do
      post event_types_url, params: { event_type: { body: @event_type.body, name: @event_type.name, user_id: @user.id } }
    end

    assert_redirected_to event_type_url(EventType.last)
  end

  test "should not create event_type" do
    assert_difference('EventType.count', 0) do
      post event_types_url, params: { event_type: { body: @event_type.body, name: "", user_id: @user.id} }
    end

    assert_response :success
  end

  test "should show event_type" do
    get event_type_url(@event_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_type_url(@event_type)
    assert_response :success
  end

  test "should update event_type" do
    patch event_type_url(@event_type), params: { event_type: { body: @event_type.body, name: @event_type.name, user_id: @user.id } }
    assert_redirected_to event_type_url(@event_type)
  end

  test "should not update event_type" do
    patch event_type_url(@event_type), params: { event_type: { body: @event_type.body, name: "", user_id: @user.id} }
    assert_response :success
  end

  test "should destroy event_type" do
    assert_difference('EventType.count', -1) do
      delete event_type_url(@event_type)
    end

    assert_redirected_to event_types_url
  end
end
