require 'test_helper'

class EventTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_type = event_types(:Impact)
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get event_types_url
    assert_response :success
    assert_select "a[text()=?]",'New Event Type'
    assert_select "a[href=?]", new_event_type_path
    assert_select ".footer>div>a", 1
  end

  test "should get new" do
    get new_event_type_url
    assert_response :success

    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", event_types_path
    assert_select ".footer>div>a", 1
  end

  test "should show event_type timeline" do
      get event_type_timeline_url(:event_type_id => @event_type.id)
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

    assert_select "a[text()=?]",'Edit'
    assert_select "a[href=?]", edit_event_type_path(@event_type)
    assert_select "a[text()=?]",'Timeline'
    assert_select "a[href=?]", event_type_timeline_path(@event_type)
    assert_select "a[text()=?]",'Map'
    assert_select "a[href=?]", geo_map_event_type_path(@event_type)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", event_types_path
    assert_select ".footer>div>a", 4
  end

  test "should map event_type" do
    get geo_map_event_type_url(@event_type)
    assert_response :success

    assert_select "a[text()=?]",'Display'
    assert_select "a[href=?]", event_type_path(@event_type)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", event_types_path
    assert_select ".footer>div>a", 2
  end

  test "should get edit" do
    get edit_event_type_url(@event_type)
    assert_response :success

    assert_select "a[text()=?]",'Show'
    assert_select "a[href=?]", event_type_path(@event_type)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", event_types_path
    assert_select ".footer>div>a", 2
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
